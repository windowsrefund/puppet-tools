# Tools

Various tools to make my life easier
----------------

### has_template

The has_template() function was written to bring the behavior of the file
resource's source attribute to the world of templates. The template() function
concatenates multiple templates when multiple paths are passed in as arguments.
Sometimes, this is not the desired behavior. In cases where it is desirable to
choose between templates, it is now possible to wrap template() around a call
to has_template() like so:

  file { '/tmp/foo': 
    content => template(has_template("example/sites/${my_site}/test.erb", 'example/global/test.erb')) 
  }

If the example above, modules/example/templates/sites/${my_site}/test.erb will
be used if it exists. Otherwise, the global template will be used. This makes
working with templates very similar to the way we can choose between file
sources using the source attribute with multiple arguments.

While not tested, it should even be possible to combine this new functionality
with the default concatenation behavior of template() like so:

  file { '/tmp/foo': 
    content => template(has_template("example/sites/${my_site}/test.erb", 'example/global/test.erb'), 'example/global/now_we_are_getting_crazy.erb') 
  }

:)

