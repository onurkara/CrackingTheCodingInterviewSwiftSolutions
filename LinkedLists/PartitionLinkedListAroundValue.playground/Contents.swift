
public class Node<T> {

    var value: T
    var next: Node?
    weak var previous: Node?

    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {

    var head: Node<T>?
    var tail: Node<T>?

    public var isEmpty: Bool {
        head == nil
    }

    public func append(node: Node<T>) {
        if let tail = tail {
            node.previous = tail
            tail.next = node
        } else {
            head = node
        }

        tail = node
    }

    public func appendHead(node: Node<T>) {
        if let head = head {
            node.next = head
            head.previous = node
        }

        head = node
    }

    public func remove(node: Node<T>) {
        if isEmpty {
            return
        }

        let previousNode = node.previous
        let nextNode = node.next

        if let previousNode = previousNode {
            previousNode.next = nextNode
        } else {
            head = nextNode
        }

        nextNode?.previous = previousNode

        if nextNode == nil {
            tail = previousNode
        }

        node.previous = nil
        node.next = nil
    }
}

//Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x.
func partitionLinkedListAroundValue(linkedList: LinkedList<Int>, value: Int) -> LinkedList<Int> {

    let updatedLinkedList = LinkedList<Int>()
    let firstNode = Node(value: linkedList.head!.value)
    updatedLinkedList.append(node: firstNode)

    while linkedList.head?.next != nil {
        let next = linkedList.head?.next
        if next!.value >= value {
            updatedLinkedList.append(node: Node(value: next!.value))
        } else {
            updatedLinkedList.appendHead(node: Node(value: next!.value))
        }

        linkedList.remove(node: linkedList.head!.next!)
    }


    return updatedLinkedList
}
