require 'listen'

class Filewatcher
  def initialize(directory = nil, commands = nil)
    # Set the directory to watch
    @directory = directory ? directory : './' 
    # Set the command to run

    defaultScripts = %w(app.rb)
	  defaultCommands = defaultScripts.map { |a| "ruby #{a} "}

    @commands = commands ? commands : defaultCommands
    configureListener
  end

  def runCommands()
    @commands.each do |command|
      system(command)
    end
  end
  
  def configureListener
    # Create a listener to watch the directory for changes
    @listener = Listen.to(@directory, only: /\.(txt|md|erb|rb)$/) do |modified, added, removed|
        # Run the command if any files were added or modified
        # Print a message for each added or modified file
        (added + modified).each do |file|
            puts "File added or modified: #{file}"
        end

        # Print a message for each removed file
        removed.each do |file|
            puts "File removed: #{file}"
        end

        if !added.empty? || !modified.empty? || !removed.empty?
          runCommands
        end
    end
  end

  def startListener
    # Start the listener
    @listener.start
  end

  def startListenerAndKeepRunning
    startListener
    # do whatever you want here...just don't exit the process :)
    sleep
  end
end

if __FILE__ == $0 # if the file is run directly instead of included
  f = Filewatcher.new
  f.startListenerAndKeepRunning
end
