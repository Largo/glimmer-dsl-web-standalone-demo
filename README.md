# Standalone Demo of Glimmer DSL for Web

This is a demo of [Glimmer DSL for Web](https://github.com/AndyObtiva/glimmer-dsl-web) without the need to run inside a rails app or any app. It is usable in a static site.
Glimmer DSL for Web allows you to write concise Ruby instead of JavaScript. It is an alternative to React, Vue.js or Svelte.


## How to use:

Make your changes to script.js.rb

```
bundle install
ruby app.rb
```

Then open index.html.

For your convience, I included filewatcher.rb which can be used to automatically regenerate the javascript file on edits to the code.


## Notes
Rails is currently still a dependency because opal-rails is included in glimmer-dsl-web, but it is technically not necessary.

