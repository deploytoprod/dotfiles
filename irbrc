require 'rubygems'
require 'wirble'
require 'pp'

Wirble.init
Wirble.colorize

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
end

def ep
  eval(paste)
end

require 'bond'
require 'bond/completion'

# toggle autocomplete method
def toggle_object_complete
  # default mode
  if @object_complete
    Bond.recomplete(:object=>'Object', :place=>:last)
    Bond.recomplete(:object=>'Object', :on=>/([^.\s]+)\.([^.\s]*)$/, :place=>:last)
  else
    non_inherited_methods = proc {|e| 
      e.object.is_a?(Module) ? e.object.methods(false) : e.object.class.instance_methods(false)
    }
    Bond.recomplete(:object=>'Object', :place=>:last, &non_inherited_methods)
    Bond.recomplete(:object=>'Object', :on=>/([^.\s]+)\.([^.\s]*)$/, :place=>:last, &non_inherited_methods)
  end
  @object_complete = !@object_complete
end

# load rails stuff?
load (File.dirname(__FILE__) + '/.railsrc') if $0 == 'irb' && ENV['RAILS_ENV']