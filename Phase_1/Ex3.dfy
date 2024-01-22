
module Ex3 {

 function reverseF(a: seq<int>) : seq<int> {
    if (|a| == 0)
      then a
      else reverseF(a[1..]) + [a[0]] 
  } 

// Ex2
method ExtendList(lst : Node?, v : int) returns (r : Node) 
  requires lst != null ==> lst.Valid()
  ensures lst != null ==> r.next == lst

  ensures lst != null ==> r.list == [ v ] + lst.list
  ensures lst != null ==> r.footprint == { r } + lst.footprint
  ensures lst == null ==> r.list == [ v ] 
  ensures lst == null ==> r.footprint == { r }

  ensures r.Valid()
  ensures fresh(r)
{

  var newNode := new Node(v);
  newNode.next := lst;

  if (lst != null) {
    newNode.footprint := { newNode } + lst.footprint;
    newNode.list := [ v ] + lst.list;
  }

  r := newNode; return;

}

class Node {

  var data : int 
  var next : Node? 

  ghost var list : seq<int>
  ghost var footprint : set<Node>

  ghost function Valid() : bool 
    reads this, footprint
    decreases footprint
  {
    (this in footprint) &&
    ((next == null) ==> list == [ data ] && footprint == { this }) &&
    ((next != null) ==> 
      (next in footprint) && 
      footprint == next.footprint + { this } && 
      (this !in next.footprint) &&
      list == [ data ] + next.list &&
      next.Valid())
  }

  constructor (val : int) 
    ensures Valid() 
      && next == null && list == [ data ] 
      && footprint == { this } 
      && val == data 
  {
    this.data := val; 
    this.next := null; 
    this.list := [ val ]; 
    this.footprint := { this };
  } 

  method prepend (val : int) returns (r : Node)
    requires Valid()
    ensures r.Valid()
    ensures r.list == [ val ] + this.list
    ensures r.footprint == { r } + this.footprint
    ensures fresh(r) 
  {
    r := new Node(val); 
    r.next := this; 
    r.footprint := { r } + this.footprint; 
    r.list := [ val ] + this.list;  
    return; 
  }

// Ex1
method reverse(tail: Node?) returns (r: Node)
  requires Valid()
  requires (tail == null) || (tail.Valid() && this.footprint !! tail.footprint)
  ensures r.Valid()
  ensures this != this.next
  
  ensures tail == null ==> r.list == reverseF(old(this.list))
  ensures tail != null ==> r.list == reverseF(old(this.list)) + tail.list
  ensures tail != null ==> old(tail.footprint) == tail.footprint
  ensures (tail == null ==> r.footprint == old(this.footprint))
  ensures (tail != null ==> r.footprint == old(this.footprint) + tail.footprint)
  ensures tail != null ==> this.next in tail.footprint
  ensures tail != null ==> this !in tail.footprint 

  modifies footprint
  decreases footprint
{

  var old_next := this.next;
  this.next := tail;

  if(tail == null) {
    this.footprint := {this};
    this.list := [this.data];
  } else {
    this.footprint := {this} + tail.footprint;
    this.list := [this.data] + tail.list;
  }

  if (old_next == null) {
    r := this;
  } else {
    r := old_next.reverse(this);
  }

  return;
}

}

}