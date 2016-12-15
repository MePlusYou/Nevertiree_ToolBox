# Collections

## [Map](Map)

HashMap TreeMap

## [Set](Set)

TreeSet HashSet

## [List](List)

ArrayList LinkedList

Collection Interface

```java
int size();
boolean isEmpty();
boolean contains(Object element);
boolean containsAll(Collection c);
boolean add(Object element);
boolean addAll(Collection c);
boolean remove(Object element);
boolean removeAll(Collection c);

void clear();

Object[] toArray();
Object[] toArray(Object a[])
```
Iterator Interface Definition

```java
Iterator iterator();

public interface Iterator{
	boolean hasNext();
	Object next();
	void remove();
}
```


List Interface

```java
Object get(int index);
Object set(int index,Object element);
void add(int index,Object element);
Object remove(int index);
int indexOf(Object o);
int lastIndexOf(Object o);
List subList(int from,int to);
```

list.subList(fromIndex,toIndex).clear()相当于从序列中从fromIndex到toIndex结束的部分删除了。

Set Interface

```java

equals()

hashCode()

```


Map Interface

```java

Object put(Object key,Object value);
Object get(Object key);

Object remove(Object key);

boolean containsKey(Object key);
boolean containsValue(Object value);

int size();

boolean isEmpty();

Set keySet();
Collection values();
Set entrySet();

```