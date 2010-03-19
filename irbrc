# Make gems available
require 'rubygems'
 
# http://drnicutilities.rubyforge.org/map_by_method/
require 'map_by_method'
 
# Dr Nic's gem inspired by
# http://redhanded.hobix.com/inspect/stickItInYourIrbrcMethodfinder.html
require 'what_methods'
 
# Pretty Print method
require 'pp'
 
# Load the readline module.
IRB.conf[:USE_READLINE] = true
 
# Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE] = :SIMPLE
 
# Tab Completion
require 'irb/completion'
 
# Automatic Indentation
IRB.conf[:AUTO_INDENT]=true
 
# Save History between irb sessions
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
 
# Wirble is a set of enhancements for irb
# http://pablotron.org/software/wirble/README
# Implies require 'pp', 'irb/completion', and 'rubygems'
require 'wirble'
Wirble.init
 
# Enable colored output
Wirble.colorize
 
# Clear the screen
def clear
system 'clear'
if ENV['RAILS_ENV']
return "Rails environment: " + ENV['RAILS_ENV']
else
return "No rails environment - happy hacking!";
end
end
 
# Shortcuts
alias c clear
 
# Load / reload files faster
# http://www.themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def fl(file_name)
   file_name += '.rb' unless file_name =~ /\.rb/
   @@recent = file_name
   load "#{file_name}"
end
 
def rl
  fl(@@recent)
end
 
# Reload the file and try the last command again
# http://www.themomorohoax.com/2009/04/07/ruby-irb-tip-try-again-faster
def rt
  rl
  eval(choose_last_command)
end
 
# prevent 'rt' itself from recursing.
def choose_last_command
  real_last = Readline::HISTORY.to_a[-2]
  real_last == 'rt' ? @@saved_last : (@@saved_last = real_last)
end
 
# Method to pretty-print object methods
# Coded by sebastian delmont
# http://snippets.dzone.com/posts/show/2916
class Object
  ANSI_BOLD = "\033[1m"
  ANSI_RESET = "\033[0m"
  ANSI_LGRAY = "\033[0;37m"
  ANSI_GRAY = "\033[1;30m"
 
  # Print object's methods
  def pm(*options)
    methods = self.methods
    methods -= Object.methods unless options.include? :more
    filter = options.select {|opt| opt.kind_of? Regexp}.first
    methods = methods.select {|name| name =~ filter} if filter
 
    data = methods.sort.collect do |name|
      method = self.method(name)
      if method.arity == 0
        args = "()"
      elsif method.arity > 0
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity < 0
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item|
      print " #{ANSI_BOLD}#{item[0].rjust(max_name)}#{ANSI_RESET}"
      print "#{ANSI_GRAY}#{item[1].ljust(max_args)}#{ANSI_RESET}"
      print " #{ANSI_LGRAY}#{item[2]}#{ANSI_RESET}\n"
    end
    data.size
  end
end
 
# http://sketches.rubyforge.org/
require 'sketches'
Sketches.config :editor => 'gvim'




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