include Glimmer

class State
 attr_accessor :name
 attr_accessor :welcome_text

 def name=(value)
    @name = value
    update_welcome_text
    puts "update name"
  end

  private

  def update_welcome_text
    self.welcome_text = "Welcome! #{@name}"
  end
end

@state = State.new

Document.ready? do
  div(parent: '#app-container') {
    div {
        label('Name: ', for: 'name-field')
        @name_input = input(type: 'text', id: 'name-field', required: true, autofocus: true) {
            value <=> [@state, :name]
        }
    }
    div {
        inner_text <= [@state, :welcome_text]
    }
    button('Greet') {
        onclick do
          $$.alert("Hello, #{@state.name}!")
        end
    }
  }
end