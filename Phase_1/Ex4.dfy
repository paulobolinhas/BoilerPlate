include "Ex3.dfy"

module Ex4 {

import Ex3=Ex3


class Queue {

  var lst1 : Ex3.Node?
  var lst2 : Ex3.Node? 

  ghost var footprint: set<Ex3.Node>
  ghost var list: seq<int> //sorted by order of push


  // Ex1
  ghost function Valid() : bool 
    reads this, this.lst1, this.lst2, if (this.lst1 != null) then this.lst1.footprint else {}, if (this.lst2 != null) then this.lst2.footprint else {}
  {
    (this.lst1 == null && this.lst2 == null ==> this.footprint == {} && this.list == []) 
    &&
    (this.lst1 == null && this.lst2 != null ==> this.lst2.Valid() && 
                                                this.footprint == this.lst2.footprint 
                                                && this.list == this.lst2.list)
    &&
    (this.lst1 != null && this.lst2 == null ==> this.lst1.Valid() && 
                                                this.footprint == this.lst1.footprint && 
                                                this.list == Ex3.reverseF(this.lst1.list))
    &&
    (this.lst1 != null && this.lst2 != null ==> this.lst1.Valid() && this.lst2.Valid() &&
                                                this.footprint == this.lst1.footprint + this.lst2.footprint &&
                                                this.list == this.lst2.list + Ex3.reverseF(this.lst1.list) &&
                                                this.lst1.footprint !! this.lst2.footprint)

  }

  // Ex2 
  constructor () 
    ensures Valid()
    ensures this.lst1 == null && this.lst2 == null && this.list == [] && this.footprint == {}
  {

    this.lst1 := null; 
    this.lst2 := null;  

    this.list := [];
    this.footprint := {};

  } 

  // Ex3.1 
  method push(val : int)
    requires this.Valid()
    ensures Valid()
    ensures this.list == old(this.list) + [val]
    ensures fresh (this.footprint - old(this.footprint))
    modifies this
  {
    this.lst1 := Ex3.ExtendList(lst1, val);

    this.footprint := this.footprint + {this.lst1};
    this.list := this.list + [val];
  }

  // Ex3.2
  method pop() returns (r : int) 
    requires this.Valid()
    requires this.list != []
    ensures this.Valid()
    ensures old(this.list) != [] ==> this.list == old(this.list)[1..]
    modifies this, footprint
  {

    if(this.lst2 == null) {
      this.lst2 := this.lst1.reverse(null); 
      this.lst1 := null;
    }
    
    if(|this.list| == 1) {
        this.list := [];
        this.footprint := {};
    } else {
        this.footprint := this.footprint - {this.lst2};
        this.list := old(this.list)[1..];  
    }
    r := this.lst2.data;
    this.lst2 := this.lst2.next;
  }

 }
    
}