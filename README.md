#Introducing the Indented-tracer gem

The following example shows how to trace the method calls in a class using the indented-tracer gem. The indented-tracer gem uses the Tracer class to detect when a method is called in the context of the class we are interested in.

    require 'indented-tracer'

    class Light
      def on
        puts 'I see the light'
      end
    end

    class Fun

      def initialize()
        @led = Light.new
      end

      def breathe()
        puts 'breathing in'
      end

      def moo(s)
        breathe
        @led.on
        puts 'you said moo ' + s
      end

      def bar()
        puts 'bar'
      end
    end

    it = IndentedTracer.new
    it.classes = ['Fun', 'Light']
    it.on

    fun = Fun.new

    fun.moo ' x 2'
    fun.bar
    it.off
    puts it.log

output:
<pre>
&lt;?polyrex schema='session/entry[classname, methodname]' delimiter='#'?&gt;
Fun#initialize
Fun#moo
  Fun#breathe
  Light#on
Fun#bar
</pre>

## Resources

* [jrobertson/indented-tracer](https://github.com/jrobertson/indented-tracer) [GitHub]

