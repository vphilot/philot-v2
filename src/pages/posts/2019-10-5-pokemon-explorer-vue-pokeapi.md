---
title: Building a Pokémon Explorer with Vue and PokéAPI
---

<route>
{
  name: "Building a Pokémon Explorer with Vue and PokéAPI",
  date: "2019-10-05",
  icon: "fluent:search-20-regular",
}
</route>

2019 is swamped with JavaScript frameworks and we have arrived in a moment when choosing your favourite is a matter of project-based preference only. From the most mature ones, I would say I like React but I love Vue. I believe there's a simple elegance in the way it handles data and a lot of flexibility in how it can be used, from a simple component to huge PWAs.

You can <Link title="See it live" url="https://gracious-cori-4bd380.netlify.com/">see it live here</Link>.

I decided to take on this project as a way to explore Vue a little more in-depth and also try the amazing <Link title="PokéAPI" url="https://pokeapi.co/">PokéAPI</Link>. Before we start, <Link title="here's the full source code on Github" url="https://github.com/vphilot/vue-pokemon-explorer">here's the full source code on Github</Link>.

## Install Vue CLI and clone the starter project

The Vue CLI interface provides a great tool to project boilerplate projects right out of the box. Assuming you have Node.js installed, run:

```bash
$ npm install -g @vue/cli
```

And create a new project with

```bash
$ vue create vue-pokemon-explorer
```

After deleting most of the boilerplate structure, this is the project tree I ended up with:

```bash
├── src
│   ├── main.js
│   ├── components
│   │   ├── PokemonCard.vue
│   │   └── Main.vue
│   ├── assets
│   │   └── logo.png
│   └── App.vue
├── public
│   ├── index.html
│   └── favicon.ico
├── package.json
├── package-lock.json
├── babel.config.js
└── README.md
```

I chose to keep it simple and only have 2 main components: `Main.vue` and `PokemonCard.vue`. Even though the project is very small, I chose to stick with [Single File Components](https://vuejs.org/v2/guide/single-file-components.html) because it's a good way to get familiar with the framework's best practices. This means that HTML, CSS, and (vue-specific) JS will live inside the same file, making it easier to isolate functionality and troubleshoot bugs on a beginner level.

## Picking a styled component library

Since the project is just a playground, I wasn't too worried about creating my CSS from scratch. That's why I chose <Link title="Buefy" url="https://buefy.org/">Buefy</Link> &mdash; I love <Link title="Bulma" url="https://bulma.io/">Bulma</Link> and its flexbox system for columns. Moreover, Buefy provides a large set of <Link title="UI components" url="https://buefy.org/documentation/input">UI components</Link> with great functionality right out of the box. Just run the npm command:

```bash
$ npm install buefy
```

After that, we have to import it in our top-level `main.js` so it becomes available to all the Vue instances:

```js
import Vue from "vue";
import App from "./App.vue";
import Buefy from "buefy";
import "buefy/dist/buefy.min.css";
```

## Building the search input and binding data

For the Search input, inside the `<template>` section of `Main.vue`, we can take advantage of Buefy's custom components (hence the "b-" before `button` and `input`) and use the **Vue directive** `v-model` to bind whatever's typed in the search form to a data object inside our component. This will make Vue react to changes every time a user types a character and give us methods to deal with that. `searchPokemon` will execute anytime the input is submitted, while `updateSuggestionsList` will execute immediately anytime our user types something.

```html
<template>
  <b-input
    id="search"
    v-model="term"
    @keyup.native.enter="searchPokemon"
    @input="updateSuggestionsList"
  />
  <b-button type="is-primary" @click.prevent="searchPokemon">
    Search
  </b-button>
</template>
```

Now it's time to bind these values to the data in our `Main.vue` in the `<script>` section. We'll also build the structure of our `result` object inside the component &mdash; we'll use this to store all the information we'll get back from the API and pass it onto our other component, `PokemonCard.vue`, which will react to changes and re-render whenever we get a new result. Interesting to notice that, even though we're not using TypeScript here, Vue requires us to specify what kind of data to expect from each property.

```js
export default {
  name: "Main",
  components: {
      // imported components will go here
  },
  props: {
      // props will go here (more on that later)
  }
  data() {
    return {
        term: "wobbuffet",
        // this will also serve as a
        // default search item on app start
        result: {
            name: String,
            imgs: [],
            height: Number,
            weight: Number,
            abilities: [],
            types: []
      }
    }
  }
}
```

Then we'll move on to the fun section: fetching the PokéAPI!

## How to handle API Requests in Vue

Using Vue means taking advantage of _Fetch_ to make HTTP calls way more simple than dealing with the old XMLHttpRequest request model. Our starter project already contains a transpiling utility to ES5 with Babel, so compatibility is not a huge concern here. Fetch will return a simple Promise that will make populating data from APIs a breeze based on whether the call is successful or not. Here's the basic syntax on how to use it:

```js
fetch(`https://someapi.com?params`)
  .then(response => {
    if (response.status !== 200) {
      //a 200 response should return an error and inform the user
    }
    response.json().then(data => {
      //do something with all this data!
    });
  })
  .catch(err => console.error(err));
```

Based on this same structure, we can build the Search function as a `method` in our `Main.vue` component:

```js
/// .. components, props, data
methods: {
    searchPokemon() {
        fetch(`https://pokeapi.co/api/v2/pokemon/${this.getTerm}`)
        .then(response => {
            if (response.status !== 200) {
            console.log( `we have a problem with status code ${response.status}`);
            return;
            }
            response.json().then(data => {
                // these are specifics on how PokéAPI formats its data
                this.result.name = data.name;
                let pickedImgs = [
                    data.sprites.back_default,
                    data.sprites.front_default
                ]
                this.result.imgs = pickedImgs.filter(x => x);
                this.result.height = data.height;
                this.result.weight = data.weight;
                this.result.abilities = data.abilities;
                this.result.types = data.types;
            });
        })
        .catch(err => console.error(err));
    }
}
```

## Passing data to a child component

Inside our `PokemonCard.vue` component, we need to be prepared to receive all this data from `Main.vue`. The easiest way of accomplishing that is by using `props`, a type of data specifically designed to pass information from parent to child component. But first we need to initialize it inside `PokemonCard.vue`:

```js
export default {
    name: "PokemonCard",
    props: {
        name: {},
        imgs: {},
        height: {},
        weight: {},
        abilities: {},
        types: {}
    }
};
```

Then we can reference the child component inside our parent `Main.vue`, using again the `v-bind` directive to make it react to data changes. This way, every time a new Search is submitted and our parent component data is updated, the `PokemonCard` component will automatically re-render with little to no effort on our side.

```html
<PokemonCard
    v-bind:name="this.result.name"
    v-bind:imgs="this.result.imgs"
    v-bind:height="this.result.height"
    v-bind:weight="this.result.weight"
    v-bind:abilities="this.result.abilities"
    v-bind:types="this.result.types" >
</PokemonCard>
```

And here we go! With a few more twists, we're able to fully set up a simple Pokémon Explorer that is super fast and takes advantage of Vue and its component system to save a lot of time and effort.
