# npm_assets

A little gem to add your npm modules to the Rails asset pipeline

## Why?

The rails asset pipeline is excellent at packaging and serving javascript (and coffeescript). 
But you still have to get these libraries into your app somehow.  NPM is the standard in the 
javascript world for distributing and packaging libraries (think rubygems).  How bout we
just use that, rather than have to go make asset gems for each javascript library we
want to use?

## How?

You'll need to install node and npm first.  Next, create a package.json file to
declare the npm libraries you need like so:

    {
      "name": "foo",
      "version": "0.0.1",
      "dependencies": {
        "coffeekup": "",
        "backbone": ""
      }
    }
    
Then, 

    $ npm install
    
This will grab the dependencies and pop em in a node_modules directory.  This gem
will then come along and add the appropriate directories from within
each module to the asset path

In your app, to actually bring in the codez, it's just a normal require
directive:

    //= require underscore
    //= require backbone
    
## Why not?

This gem really doesn't deal with the issue of namespacing, so it may not work with some npms.  In the future, I'd like to add a separate directive (npm_require maybe?) to bring in npms
and assign them to a namespace, but for now this gem will only help you with npm libraries than know how to deal with being in the browser (eg don't use exports if it's not present). 
Also, it you still have to add a require directive for each file, it won't grab dependencies for you (yet).

For an alternative solution, see nodeify.  If you're down with having all your javascript code follow commonjs 
module semantics, it seems like a good bet.
