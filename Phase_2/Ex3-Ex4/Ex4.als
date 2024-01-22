
open ex3
open util/ordering[Id]

// 4.1

sig ONode extends Node {
     id: one Id
}

sig Id { }

// Nodes in a headnode must have ascending IDs
fact c1 {
    always all hn: HeadNode | all n1, n2: ONode | n1 in hn.frst.*nnext && n2 in hn.frst.*nnext && n1 in n2.^nprev => n1.id.lt[n2.id]
}

// All nodes have different IDs
fact c2 {
    always all n1, n2: ONode | n1 != n2 => n1.id != n2.id
}

// 4.2 --- Generate an instance of the model with at least two non-empty doubly-linked lists and five onodes, and no free nodes
run {
  all n: ONode | n in HeadNode.frst.*nnext
  all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
  } for exactly 2 HeadNode, exactly 5 ONode, 5 Id, 0 Node
// -------------------------------

// 4.3 (REMOVE)

pred removeO[on: ONode, hn: HeadNode] {
    remove[on, hn]
}

// 4.4 (REMOVE) --- Generate an instance of the model with at least two non-empty doubly-linked lists and five onodes, and no free nodes
run {all on: ONode | on in HeadNode.frst.*nnext  
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some on: ONode, hn: HeadNode | removeO[on, hn] } for exactly 2 HeadNode, exactly 5 ONode, 5 Id, 0 Node, 2 steps
// -------------------------------

// 4.4 (INSERT)

pred insertO[on: ONode, hn: HeadNode] {
    insert_single_elem[on, hn]
    or
    insert_lst[on, hn]
    or
    insert_frst[on, hn]
    or
    some onnext,onprev:Node | insert_middle[on, onnext, onprev, hn]
}

pred insert_single_elem[n: ONode, hn: HeadNode] {
     
     //pre
     hn.frst = hn.lst
     all hn1:HeadNode | n not in hn1.frst.*nnext

     //pos
     hn.lst' = n

     //frame
     all hn1:HeadNode | hn1 != hn => hn1.frst'.*nnext = hn1.frst.*nnext && hn1.frst' = hn1.frst && hn1.lst' = hn1.lst
     all n1:ONode | n1 != n => n1.nnext'= n1.nnext and n1.nprev' = n1.nprev

     all n1:ONode | n1 != n => n1.id' = n1.id
}

pred insert_lst[n: ONode, hn: HeadNode] {
     
     //pre
     all hn1:HeadNode | n not in hn1.frst.*nnext

     //pos
     hn.lst.nnext' = n

     //frame
     all hn1:HeadNode | hn1 != hn => hn1.frst'.*nnext = hn1.frst.*nnext && hn1.frst' = hn1.frst && hn1.lst' = hn1.lst
     all n1:ONode | n1 != hn.lst && n1 != n => n1.nnext'= n1.nnext and n1.nprev' = n1.nprev
     hn.lst.nprev' = hn.lst.nprev
     hn.lst'.nnext = hn.lst.nnext
     hn.frst' = hn.frst

     all n1:ONode | n1 != n => n1.id' = n1.id
}

pred insert_frst[n: ONode, hn: HeadNode] {

     //pre
     all hn1:HeadNode | n not in hn1.lst.*nprev

     //pos
     hn.frst.nprev' = n

     //frame
     all hn1:HeadNode | hn1 != hn => hn1.frst'.*nnext = hn1.frst.*nnext && hn1.frst' = hn1.frst && hn1.lst' = hn1.lst
     all n1:ONode | n1 != hn.frst && n1 != n => n1.nnext'= n1.nnext and n1.nprev' = n1.nprev
     hn.frst.nnext' = hn.frst.nnext
     hn.frst'.nprev = hn.frst.nprev
     hn.lst' = hn.lst

     all n1:ONode | n1 != n => n1.id' = n1.id
}

pred insert_middle[n: ONode, onnext: ONode, onprev: ONode, hn: HeadNode] {

     //pre
     all hn1:HeadNode | n not in hn1.frst.*nnext
     onnext in hn.frst.*nnext && onprev in hn.frst.*nnext
     onnext.nprev = onprev && onprev.nnext = onnext

     //pos
     onnext.nprev' = n && onprev.nnext' = n
     n.nnext' = onnext && n.nprev' = onprev

     //frame
     all hn1:HeadNode | hn1 != hn => hn1.frst'.*nnext = hn1.frst.*nnext && hn1.frst' = hn1.frst && hn1.lst' = hn1.lst
     all n1:ONode | n1 != n && n1 != onnext && n1 != onprev => n1.nnext'= n1.nnext and n1.nprev' = n1.nprev
     onnext.nnext' = onnext.nnext && onprev.nprev' = onprev.nprev
     hn.frst' = hn.frst && hn.lst' = hn.lst

     all n1:ONode | n1 != n => n1.id' = n1.id
}

// 4.4 (INSERT) --- Generate an instance of the model with at least two non-empty doubly-linked lists and five onodes, and no free nodes
run {all n: ONode | n in HeadNode.frst.*nnext 
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some n: ONode, hn: HeadNode | insertO[n, hn] } for exactly 2 HeadNode, exactly 5 ONode, 5 Id, 0 Node, 2 steps
// -------------------------------
// TEST INSERT - single element
run {all n: ONode | n in HeadNode.frst.*nnext 
     eventually some n: ONode, hn: HeadNode | insert_single_elem[n, hn] } for exactly 2 HeadNode, exactly 2 ONode, 2 Id, 0 Node, 2 steps
// -------------------------------
// TEST INSERT - last
run {all n: ONode | n in HeadNode.frst.*nnext 
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some n: ONode, hn: HeadNode | insert_lst[n, hn] } for exactly 2 HeadNode, exactly 5 ONode, 5 Id, 0 Node, 2 steps
// -------------------------------
// TEST INSERT - first
run {all n: ONode | n in HeadNode.frst.*nnext
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some n: ONode, hn: HeadNode | insert_frst[n, hn] } for exactly 2 HeadNode, exactly 5 ONode, 5 Id, 0 Node, 2 steps
// -------------------------------
// TEST INSERT - middle
run {all n: ONode | n in HeadNode.frst.*nnext 
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some n,onnext,onprev: ONode, hn: HeadNode | insert_middle[n,onnext,onprev,hn] } for exactly 2 HeadNode, exactly 5 ONode, 5 Id, 0 Node, 2 steps
// -------------------------------

