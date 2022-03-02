---
title: Fetching a DOM element's next sibling with Vanilla JavaScript
---

<route>
{
  name: "Fetching a DOM element's next sibling with Vanilla JavaScript",
  date: "2020-08-18",
  icon: "fluent:next-20-regular",
}
</route>

This week when building a component I stumbled upon an issue that got the thinking a little. We needed a button that would be future proof and take users to the ***next section*** of the page, regardless of what that section would be.

There's a native implementation for this use case, the `nextElementSibling` property:

```js
var nextNode = elementNodeReference.nextElementSibling;
```

However, the native option will return **any**  DOM tree sibling, including scripts, styles, and other tags. For my particular case, I was looking for elements that were actually rendered on the page. Here's the basic acceptance criteria of the function we'll be writing:

* We want `<script>`, `<link>` and `<style>` tags to be disregarded as valid results
* The function must check for null values (in case there's no valid sibling)
* **Vanilla JS** only

## Outlining the function

Our helper function will accept an `element` argument which is the current element whose sibling we want to return:

```js
    function getElementNextSibling(element){}
```

A pretty straightforward way of getting all of the siblings is by:
* Going **one level up** to its parent (JS property `parentNode`)
* Descending back again **one level down** to get all of the parent node's children (JS property `children`)


```js
    function getElementNextSibling(element) {
        const children = element.parentNode.children;
    }
```

Now we can do all sorts of mapping, sorting, and filtering methods in our `children` object to find the siblings! **Except that we can't**. Using `element.parentNode.children` will return a `NodeList` object that doesn't accept all the Array methods we're looking for at the moment. To make this work, we need to create a new instance of `Array` type by using the following ES6 syntax:

```js
    function getElementNextSibling(element) {
        const children = Array.from(element.parentNode.children);
    }
```

## Filtering the results

Now that we can use the `filter` method to return find what we're looking for in the (sometimes) large children array, it's important to establish what types of DOM nodes we care about:

```js
    function getElementNextSibling(element) {
        const children = Array.from(element.parentNode.children);
        const siblings = children.filter((child) => {
            //but what are we looking for really?
        })
    }
```

Since every single element in this array is a DOM `Node`, we can leverage some properties of this object to find what we're looking for.

The first one is `node.nodeType`. The `nodeType` property has a value that can help us identify quickly target the value `1`, which is `ELEMENT_NODE`. Many other types are available though, <Link title="here's the full NodeType reference on MDN" url="https://developer.mozilla.org/en-US/docs/Web/API/Node/nodeType">here's the full NodeType reference on MDN</Link>.


```js
    if (child.nodeType === 1) {

    }
```

This is not enough however, as `<script>`, `<style>`, and `<link>`tags will still be processed as valid results. To resolve this issue, we can leverage another property of the `Node` object called `tagName`:

```js
    if (child.nodeType === 1 && child.tagName !== "SCRIPT" && child.tagName !== "LINK" && child.tagName !== "STYLE") {
        //will return the visible, rendered elements only
    }
```

## Finding who is the next sibling

So far, we're able to return siblings of our element (by getting all of the children of its parent). Here's how the function looks so far:

```js
    function getElementNextSibling(element) {
        const children = Array.from(element.parentNode.children);
        const siblings = children.filter((child) => {
                child.nodeType === 1 && child.tagName !== "SCRIPT" && child.tagName !== "LINK" && child.tagName !== "STYLE"
        })
    }
```

Now we need a way to find the next direct sibling of our element, considering all the elements present in the `siblings` array match our criteria. A simple way to accomplish this is by:

* Finding where our **current element** stands in the siblings `array` by getting its `index`
* Finding what the next direct sibling is by simply adding `1` to that index


```js
    const currentElementIndex = siblings.indexOf(element);
    const nextElementIndex = currentElementIndex + 1;
```

Finally, we add a last check just to ensure our function is returning an element (since there is a possibility our current element is the last on its parent's hierarchy). This is how the final result looks like:

```js
    function getElementNextSibling(element) {
        const children = Array.from(element.parentNode.children);
        const siblings = children.filter((child) => {
                child.nodeType === 1 && child.tagName !== "SCRIPT" && child.tagName !== "LINK" && child.tagName !== "STYLE"
        });

        const currentElementIndex = siblings.indexOf(element);
        const nextElementIndex = currentElementIndex + 1;

        if (siblings[nextElementIndex]) {
            return siblings[nextElementIndex];
        } else {
            return null;
        }
    }
```

## Working with IE and ES5

Since the `Array.from` method might return an error on Internet Explorer even when using Babel, there's a last modification we can implement to make this function compatible with older browsers (if that's included in your target audience):

```js
function getElementNextSibling(element) {
    const children = Array.prototype.slice.call(element.parentNode.children);
    // everything else stays the same
}
```
