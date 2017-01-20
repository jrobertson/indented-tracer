#!/usr/bin/env ruby

# file: indented-tracer.rb

require 'tracer'

class IndentedTracer < Tracer

  attr_accessor :classes
  
  def initialize()
    super

    add_filter do |event, file, line, id, binding, klass, *rest|
      if klass.to_s[/#{@classes.join('|')}/] then

        if event == 'call' then

          if @a.nil? then
            @a = []
            @current = @a

          end
 
          @current << [klass.to_s + '#' + id.to_s]            
          @grandparent = @parent
          @parent = @current
          @current = @current.last

        elsif event == 'return'

          @current = @parent
          @parent = @grandparent
        end 
        
      end
    end

  end

  def log(title, tags: tags=[])
    "<?polyrex schema='session[title,tags]/entry[classname, methodname]' " + \
        "delimiter='#'?>\ntitle: #{title}\ntags: #{(['trace'] + tags)
        .join(' ')}\n\n" +  print_all(@a)
  end

  private

  def print_all(a, buffer='', indent=0)
    lines = a.map do |x|
      r = ('  ' * indent) + x.first.to_s
      x.length > 1 ? r + "\n" + print_all(x[1..-1], buffer, indent+1) : r
    end
    lines.join("\n")
  end

end
