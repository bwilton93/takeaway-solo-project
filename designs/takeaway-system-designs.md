# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices.

> As a customer
> So that I can order the meal I want
> I would like to be able to select some number of several available dishes.

> As a customer
> So that I can verify that my order is correct
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use doubles too.

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌──────────────────────────────────────────────┐ ┌──────────────────────────────────┐
│ Diary - MainDiary                            │ │ Todo list - TodoList             │
│                                              │ │                                  │
│  - add(entry)                                │ │  - add(todo)                     │
│                                              │ │                                  │
│  - show_all(entries) = [all entries]         │ │  - show(todos) => show all todos │
│                                              │ │                                  │
│  - search_by(reading_time) => [some entries] │ │                                  │
│                                              │ │                                  │
│  = show_all(phone_numbers) => [numbers]      │ │                                  │
└───────────────┬──────────────────────────────┘ └─────┬────────────────────────────┘
                │                                      │
                │                                      │
                │owns a list of                        │owns a list of
                │                                      │
                │                                      │
                ▼                                      ▼
┌───────────────────────────────────┐            ┌───────────────────────────────┐
│ DiaryEntry(contents,phone_number) │            │ Todo(contents)                │
│                                   │            │                               │
│  - contents                       │            │  - contents                   │
│  - mobile number (default = nil)  │            │  - complete/incomplete        │
│                                   │            │                               │
│  - extract(contents)              │            │  - extract(contents)          │
│     => return contents            │            │    => return contents         │
│                                   │            │                               │
│  - reading_time(wpm)              │            │  - extract(status)            │
│     => All entries readable       │            │    => return complete status  │
│                                   │     ┼      │                               │
│  - extract(phone_number)          │            │  - finish(task)               │
│     => return phone number        │            │    => update complete status  │
└───────────────────────────────────┘            └───────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class MainDiary
  def initialize
    # create as an empty array
  end

  def add(entry)
    # add instance of DiaryEntry to MainDiary list
  end

  def show_all
    # return list of all diary entries
  end

  def show_by_reading_time(reading_time, wpm)
    # return all DiaryEntry instances that can be read in the correct time
  end

  def show_all_phone_numbers
    # return list of all phone numbers
  end
end

class DiaryEntry
  def initialize(contents, number = nil)
    # @contents = contents  
    # @number = number
  end

  def show_contents(contents)
    # returns @contents
  end

  def show_number(number)
    # returns @number
  end

  def reading_time(wpm)
    # returns time to read entry to next whole number
  end
end

class TodoList
  def initialize
    # intializes with an empty list of Todo objects
  end

  def add(todo) # todo is an instance of Todo
    # Todo gets added to the list
    # returns nothing
  end

  def show(todos)
    # returns whole list of todos
  end

  def show(incomplete)
   # returns list of all incomplete tasks
  end

  def show(complete)
   # returns list of all complete tasks
  end
end

class Todo
  def initialize(task)
    # @todo = task
    # @complete = false
  end

  def show(todo)
    # return @todo
  end

  def task_status(status)
    # returns @complete
  end

  def finish(task)
    # updates complete flag
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# Gets all the diary entries
diary = MainDiary.new
entry_1 = DiaryEntry.new("Entry 1", "07924818828")
entry_2 = DiaryEntry.new("Entry 2")
diary.add(entry_1)
diary.add(entry_2)
diary.show_all # => [entry_1, entry_2]

# Gets all the diary entries
todo_list = TodoList.new
task_1 = Todo.new("Organise my Pokemon")
task_2 = Todo.new("Clean my desk")
todo_list.add(task_1)
todo_list.add(task_2)
todo_list.show # => [task_1, task_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
diary_entry = DiaryEntry.new("Entry 1", "07924818828")
diary_entry.show_contents(contents) # => "Entry 1"
diary_entry.show_number(number) # => "07924818828"

todo = Todo.new("Organise my Pokemon")
result = todo.show
expect(result).to eq "Organise my Pokemon"

# fail case
expect { Todo.new(6) }.to raise_error "Todo entered is not a string"

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._

