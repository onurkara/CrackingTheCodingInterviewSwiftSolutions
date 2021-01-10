
public class Node<T> {

    var value: T
    var next: Node?
    weak var previous: Node?

    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {

    private var head: Node<T>?
    private var tail: Node<T>?

    public var isEmpty: Bool {
        head == nil
    }

    public var fist: Node<T>? {
        return tail
    }

    public var last: Node<T>? {
        return tail
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


// Implement an algorithm to delete a node in the middle of a singly linked list, given only access to that node.
func removeAnElementFromLinkedList(list: LinkedList<String>, node: Node<String>) {
    list.remove(node: node)
}

