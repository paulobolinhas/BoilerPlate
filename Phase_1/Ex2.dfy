
function sorted(s : seq<int>) : bool {
  forall k1, k2 :: 0 <= k1 <= k2 < |s| ==> s[k1] <= s[k2]
}


// Ex1
method copy(a : array<int>, l : int, r : int) returns (ret : array<int>)
  requires 0 <= l < r <= a.Length 
  ensures ret[..] == a[l..r]
{
  ret := new int[r - l];

  var i := 0;
  var j := l;

  while (j < r && i < ret.Length) 
    invariant l <= j <= r
    invariant 0 <= i <= ret.Length 
    invariant a[l..j] == ret[..i]
    decreases r - j, ret.Length - i
  {
    ret[i] := a[j];
    i := i + 1;
    j := j + 1;
  }
  return;
}



// Ex2
method mergeArr(a : array<int>, l : int, m : int, r : int) 
  requires 0 <= l < m < r <= a.Length  
  requires sorted(a[l..m]) && sorted(a[m..r])
  ensures sorted(a[l..r]) 
  ensures a[..l] == old(a[..l])
  ensures a[r..] == old(a[r..]) 
  modifies a 
{
 
  var leftArr := copy(a, l, m);
  var leftPointer := 0;

  var rightArr := copy(a, m, r);
  var rightPointer := 0;

  var i := l;

  while(i < r)
    invariant 0 <= leftPointer <= leftArr.Length
    invariant 0 <= rightPointer <= rightArr.Length
    invariant l <= i <= r

    invariant a[..l] == old(a[..l])
    invariant a[r..] == old(a[r..])
    invariant a[i..r] == old(a[i..r])

    invariant sorted(leftArr[..])
    invariant sorted(rightArr[..])
    invariant sorted(a[l..i])

    invariant i == (l + leftPointer + rightPointer)

    //when leftPointer and rightPointer are outside of its array boundaries
    invariant l < i < r && rightPointer >= rightArr.Length && leftPointer < leftArr.Length ==> a[i-1] <= leftArr[leftPointer]
    invariant l < i < r && leftPointer >= leftArr.Length && rightPointer < rightArr.Length ==> a[i-1] <= rightArr[rightPointer]

    //leftPointer and rightPointer inside its arrays
    invariant l < i < r && 0 <= leftPointer < leftArr.Length && 0 <= rightPointer < rightArr.Length ==> a[i-1] <= leftArr[leftPointer] && a[i-1] <= rightArr[rightPointer] 

    decreases r - i
  {

    if (leftPointer < leftArr.Length && rightPointer < rightArr.Length) {

      if (leftArr[leftPointer] <= rightArr[rightPointer]) {
        a[i] := leftArr[leftPointer];
        leftPointer := leftPointer + 1;
      } else {
        a[i] := rightArr[rightPointer];
        rightPointer := rightPointer + 1;
      }
    
    } else {

      if (leftPointer < leftArr.Length && rightPointer >= rightArr.Length) {
        a[i] := leftArr[leftPointer];
        leftPointer := leftPointer + 1;
      } else if (rightPointer < rightArr.Length && leftPointer >= leftArr.Length) {
        a[i] := rightArr[rightPointer];
        rightPointer := rightPointer + 1;
      }

    }

    i := i + 1;

  }

}


// Ex3
method sort(a : array<int>) 
  ensures sorted(a[..])
  modifies a 
{
  mergeSortAux(a, 0, a.Length);
}

method mergeSortAux(a: array<int>, l: int, r: int)
  requires 0 <= l <= r <= a.Length
  ensures sorted(a[l..r])
  ensures a[..l] == old(a[..l])
  ensures a[r..] == old(a[r..])
  decreases r - l  
  modifies a
{

  if (r <= l+1) {
    return;
  }
  assert(l < r);
  var middle := (r + l) / 2; //prevents overflow over (l + r) / 2
  mergeSortAux(a, l, middle);
  mergeSortAux(a, middle, r);

  mergeArr(a, l, middle, r);
}




