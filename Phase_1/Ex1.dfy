
datatype Tree<V> = Leaf(V) | SingleNode(V, Tree<V>) | DoubleNode(V, Tree<V>, Tree<V>)

datatype Code<V> = CLf(V) | CSNd(V) | CDNd(V)

function serialise<V>(t : Tree<V>) : seq<Code<V>> 
  decreases t 
{
  match t {
    case Leaf(v) => [ CLf(v) ]
    case SingleNode(v, t) => serialise(t) + [ CSNd(v) ]
    case DoubleNode(v, t1, t2) => serialise(t2) + serialise(t1) + [ CDNd(v) ]
  }
}

// Ex 1
function deserialise<V>(s: seq<Code<V>>) : seq<Tree<V>>
{
  deserializeAux(s, [])
}

function deserializeAux<V> (cds: seq<Code<V>>, trees: seq<Tree<V>>) : seq<Tree<V>>
  decreases cds, trees
{
  if (|cds| == 0)
    then trees
    else deserializeAux(cds[1..], deserializeAux2(cds[0], trees))
}

function deserializeAux2<V> (cd: Code<V>, trees: seq<Tree<V>>) : seq<Tree<V>>
{
  match cd {
    case CLf(v) => [Leaf(v)] + trees
      
    case CSNd(v) => 
      if |trees| < 1 then []
      else 
        var child := trees[0];
        [SingleNode(v, child)] + trees[1..]
      
    case CDNd(v) =>
      if |trees| < 2 then []
      else
        var child1 := trees[0];
        var child2 := trees[1];
        [DoubleNode(v, child1, child2)] + trees[2..]
  }
}

// Ex 2
method TestSerialiseLeaf() {
  var tree := Leaf(10);
  var treeSerialized := [CLf(10)];
  assert serialise(tree) == treeSerialized;
}

method TestSerialiseSingleNode() {
  var tree := SingleNode(1, SingleNode(2, Leaf(3)));
  var treeSerialized := [CLf(3), CSNd(2), CSNd(1)];
  assert serialise(tree) == treeSerialized;
}

method TestSerialiseDoubleNode() {
  var tree := DoubleNode(5, SingleNode(4, Leaf(8)), DoubleNode(6, Leaf(3), Leaf(7)));
  var treeSerialized := [ CLf(7), CLf(3), CDNd(6), CLf(8), CSNd(4), CDNd(5) ];
  assert serialise(tree) == treeSerialized;
}


// Ex 3 
method TestDeserialiseLeaf() {
  var tree := Leaf(10);
  var treeSerialized := serialise(tree);
  var treeDeserialized := deserialise(treeSerialized);
  SerialiseLemma(tree);
  assert (treeDeserialized == [tree]);
}

method TestDeserialiseSingleNode() {
  var tree := SingleNode(1, SingleNode(2, Leaf(3)));
  var treeSerialized := serialise(tree);
  var treeDeserialized := deserialise(treeSerialized);
  SerialiseLemma(tree);
  assert (treeDeserialized == [tree]);
}

method TestDeserialiseDoubleNode() {
  var tree := DoubleNode(5, SingleNode(4, Leaf(8)), DoubleNode(6, Leaf(3), Leaf(7)));
  var treeSerialized := serialise(tree);
  var treeDeserialized := deserialise(treeSerialized);
  SerialiseLemma(tree);
  assert (treeDeserialized == [tree]);
}

// Ex 4 
lemma SerialiseLemma<V>(t: Tree<V>)
    ensures deserialise(serialise(t)) == [t]
{
    assert serialise(t) + [] == serialise(t);
    SerialisationLemma(t, [], []);  
}

lemma SerialisationLemma<V>(t: Tree<V>, cds: seq<Code<V>>, ts: seq<Tree<V>>)
    ensures deserializeAux(serialise(t) + cds, ts) == deserializeAux(cds, [t] + ts)
    decreases t
{
    match t {
        case Leaf(v) => 
            calc {
                deserializeAux(serialise(t) + cds, ts);
                    == 
                      deserializeAux([CLf(v)] + cds, ts);
                    == 
                      deserializeAux(cds, deserializeAux2(CLf(v), ts));
                    == 
                      deserializeAux(cds, [Leaf(v)] + ts);
            }
            
        case SingleNode(v, t1) => 
            calc {
                deserializeAux(serialise(t) + cds, ts);
                    == 
                      deserializeAux(serialise(t1) + [CSNd(v)] + cds, ts);
                    ==
                      assert serialise(t1) + [CSNd(v)] + cds == serialise(t1) + ([CSNd(v)] + cds);
                      deserializeAux(serialise(t1) + ([CSNd(v)] + cds), ts);
                    == { SerialisationLemma(t1, [CSNd(v)] + cds, ts); }
                      deserializeAux([CSNd(v)] + cds, [t1] + ts);
                    == 
                      deserializeAux(cds, deserializeAux2(CSNd(v), [t1] + ts));
                    ==
                      deserializeAux(cds, [SingleNode(v, t1)] + ts);
                    == 
                      deserializeAux(cds, [t] + ts);
            }

        case DoubleNode(v, t1, t2) => 
            calc {
                deserializeAux(serialise(t) + cds, ts);
                    ==  
                      deserializeAux(serialise(t2) + serialise(t1) + [CDNd(v)] + cds, ts);
                    ==
                      assert serialise(t2) + serialise(t1) + [CDNd(v)] + cds == serialise(t2) + (serialise(t1) + [CDNd(v)] + cds);
                      deserializeAux(serialise(t2) + (serialise(t1) + [CDNd(v)] + cds), ts);
                    == { SerialisationLemma(t2, serialise(t1) + [CDNd(v)] + cds, ts); }
                      deserializeAux(serialise(t1) + [CDNd(v)] + cds, [t2] + ts);
                    ==
                      assert serialise(t1) + [CDNd(v)] + cds == serialise(t1) + ([CDNd(v)] + cds); 
                      deserializeAux(serialise(t1) + ([CDNd(v)] + cds), [t2] + ts);
                    == { SerialisationLemma(t1, [CDNd(v)] + cds, [t2] + ts); }
                      deserializeAux([CDNd(v)] + cds, [t1] + ([t2] + ts));
                    == 
                      assert [ t1 ] + ([ t2 ] + ts) == [ t1, t2] + ts;
                      deserializeAux([CDNd(v)] + cds, [t1,t2] + ts);
                    ==
                      deserializeAux(cds, deserializeAux2(CDNd(v), [t1,t2] + ts));
                    ==
                      deserializeAux(cds, [DoubleNode(v,t1,t2)] + ts);
                    ==
                      deserializeAux(cds, [t] + ts);
            }
    }
}
