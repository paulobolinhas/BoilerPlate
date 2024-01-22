
module ex3

// 3.1

sig HeadNode {
    var lst: lone Node,
    var frst: lone Node
}

sig Node {
    var nnext: lone Node,
    var nprev: lone Node
}

// A node can't be connected to itself
fact c1 {
     always no (^nnext & iden) 
     always no (^nprev & iden)
}

// Reverse next has to be equal to prev
fact c2 {
     always ~nnext = nprev 
}

// Headnodes lasts cant have nexts and firsts cant have prevs
fact c3 {
    always all hn:HeadNode | hn.lst.nnext = none && hn.frst.nprev = none
}

// If a first exists then a lasts exists
fact c4 {
     always all hn : HeadNode | some hn.frst <=> some hn.lst
}

// For a headnode with a first and a last, these two have to be part of the same list, inicial and end point
fact c5 {
     always all hn:HeadNode | some hn.frst && some hn.lst => hn.frst in hn.lst.*nprev && hn.lst in hn.frst.*nnext
}

// A node cant be in two list at the same time (disjoin)
fact c6 {
     always all hn1,hn2: HeadNode | hn1 != hn2 implies no (hn1.frst.*nnext & hn2.frst.*nnext)
}

// Either a node is free or is in only one list
fact c7 {
     always all n: Node | free[n] or (one hn: HeadNode | n in hn.frst.*nnext)
}

// Case free nodes
pred free [n:Node]{
     n.nnext = none && n.nprev = none && n.~frst = none && n.~lst = none
}

// 3.2 --- Generate an instance of the model with at least two non-empty doubly-linked lists and five nodes, and no free nodes
run {some hn1, hn2: HeadNode | hn1.frst != none and hn2.frst != none
     all n:Node | (one hn: HeadNode | n in hn.frst.*nnext) 
     all n: Node | n in HeadNode.frst.*nnext } for exactly 2 HeadNode, exactly 5 Node
// -------------------------------

// 3.3 (INSERT)

pred insert[n: Node, hn: HeadNode] {

     //pre
     all hn1:HeadNode | n not in hn1.frst.*nnext

     //pos
     hn.lst' = n && hn.lst.nnext' = n
     n.nprev' = hn.lst && n.nnext' = none

     //frame
     all hn1:HeadNode | hn1 != hn => hn1.frst'.*nnext = hn1.frst.*nnext && hn1.frst' = hn1.frst && hn1.lst' = hn1.lst
     all n1:Node | n1 != hn.lst && n1 != n => n1.nnext'= n1.nnext and n1.nprev' = n1.nprev
     hn.lst.nprev' = hn.lst.nprev
     hn.lst'.nnext = hn.lst.nnext
     hn.frst' = hn.frst
}

// 3.4 (INSERT) --- Generate an instance of the model with at least two non-empty doubly-linked lists and five nodes, and no free nodes
run {all n: Node |n in HeadNode.frst.*nnext
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some hn: HeadNode, n: Node | insert[n, hn] } for exactly 2 HeadNode, exactly 5 Node, 2 steps
// -------------------------------

// 3.3 (INSERT)

pred remove[n: Node, hn: HeadNode] {
    remove_single_elem[n, hn]
    or
    remove_lst[n, hn]
    or
    remove_frst[n, hn]
    or
    remove_middle[n, hn]
}

pred remove_single_elem[n: Node, hn: HeadNode] {

    //pre
    hn.frst = hn.lst
    n in hn.frst  
    n in hn.lst 

    //post
    n.nnext' = none && n.nprev' = none
    hn.frst' = none && hn.lst' = none
    hn.frst.nprev' = none && hn.lst.nnext' = none

     //frame
    all hn1: HeadNode | hn1 != hn => hn1.frst'.*nnext = hn1.frst.*nnext && hn1.frst' = hn1.frst && hn1.lst' = hn1.lst && hn1.frst'.*nnext = hn1.frst.*nnext
    all n1:Node | n1 != n => n1.nnext'= n1.nnext and n1.nprev' = n1.nprev
}   

pred remove_lst[n: Node, hn: HeadNode] {

     //pre
     n != hn.frst && n = hn.lst
     n in hn.frst.*nnext

     //pos
     hn.lst' = n.nprev
     n.nnext = none && n.nnext' = none && n.nprev'= none && n.nprev.nnext' = none
     hn.frst.nprev' = none && hn.lst.nnext' = none

     //frame
     all hn1:HeadNode | hn1 != hn => hn1.frst'.*nnext = hn1.frst.*nnext && hn1.frst' = hn1.frst && hn1.lst' = hn1.lst
     all n1:Node | n1 != n && n1 != n.nprev => n1.nnext'= n1.nnext and n1.nprev' = n1.nprev
     // not fully covered in previous all, the next of the node before last changes but his previous doesn't
     n.nprev.nprev' = n.nprev.nprev
     hn.frst' = hn.frst
}

pred remove_frst[n: Node, hn: HeadNode] {

    //pre
     n = hn.frst && n != hn.lst
     n in hn.lst.*nprev

    //post
     hn.frst' = n.nnext
     n.nprev = none && n.nprev' = none && n.nnext'= none && n.nnext.nprev' = none
     hn.frst.nprev' = none && hn.lst.nnext' = none

    //frame
     all hn1:HeadNode | hn1 != hn => hn1.frst'.*nnext = hn1.frst.*nnext && hn1.frst' = hn1.frst && hn1.lst' = hn1.lst
     all n1:Node | n1 != n && n1 != n.nnext => n1.nnext'= n1.nnext and n1.nprev' = n1.nprev
     // not fully covered in previous all, the previous of the node after first changes but his next doesn't
     n.nnext.nnext' = n.nnext.nnext 
     hn.lst' = hn.lst
}

pred remove_middle[n: Node, hn: HeadNode] {
     
    //pre
    n != hn.frst && n != hn.lst
    n in hn.frst.*nnext
    n in hn.lst.*nprev

    //post
    n.nprev' = none && n.nnext'= none 
    n.nnext.nprev' = n.nprev && n.nprev.nnext' = n.nnext

    //frame
    hn.frst.nprev' = none && hn.lst.nnext' = none
    all hn1:HeadNode | hn1 != hn => hn1.frst'.*nnext = hn1.frst.*nnext && hn1.frst' = hn1.frst && hn1.lst' = hn1.lst
    all n1:Node | n1 != n && n1 != n.nnext && n1 != n.nprev => n1.nnext'= n1.nnext and n1.nprev' = n1.nprev
    n.nnext.nnext' = n.nnext.nnext && n.nprev.nprev' = n.nprev.nprev
    hn.frst' = hn.frst && hn.lst' = hn.lst

}

// 3.4 (REMOVE) --- Generate an instance of the model with at least two non-empty doubly-linked lists and five nodes, and no free nodes
run {all n: Node | n in HeadNode.frst.*nnext 
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some hn: HeadNode, n: Node | remove[n, hn] } for exactly 2 HeadNode, exactly 5 Node, 2 steps
// -------------------------------
// TEST REMOVE - single element
run {all n: Node | n in HeadNode.frst.*nnext 
     eventually some hn: HeadNode, n: Node | remove_single_elem[n, hn] } for exactly 2 HeadNode, exactly 5 Node, 2 steps
// -------------------------------

// TEST REMOVE - last
run {all n: Node | n in HeadNode.frst.*nnext 
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some hn: HeadNode, n: Node | remove_lst[n, hn]} for exactly 2 HeadNode, exactly 5 Node, 2 steps
// -------------------------------

// TEST REMOVE - first
run {all n: Node | n in HeadNode.frst.*nnext 
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some hn: HeadNode, n: Node | remove_frst[n, hn]} for exactly 2 HeadNode, exactly 5 Node, 2 steps
// -------------------------------

// TEST REMOVE - middle
run {all n: Node | n in HeadNode.frst.*nnext 
     all hn1, hn2: HeadNode | hn1.frst != none and hn2.frst.nnext != none 
     eventually some hn: HeadNode, n: Node | remove_middle[n, hn]} for exactly 2 HeadNode, exactly 5 Node, 2 steps
// -------------------------------