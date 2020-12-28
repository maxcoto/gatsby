require 'fileutils'

name = ARGV.shift

# PATH ------------------------------------------------------------------------
PATH = '../../chatterbox/chatter_cli/src'

# App.js ----------------------------------------------------------------------
add_reducer = ["#{name}: state.#{name},", "//[+add_reducer+]"]
app_path = "#{PATH}/App.js"
app_file = File.read(app_path)
app_file = app_file.gsub("//[+add_reducer+]", add_reducer.join("\n\t\t"))
File.open(app_path, "w") { |file| file.puts app_file }


# redux/reducers/ - new file --------------------------------------------------
new_reducer = """
const #{name} = (state = [], action) => {
  switch (action.type) {
  case 'SET_#{name.upcase}':
    return action.#{name}
  default:
    return state
  }
}
export default #{name}
"""
reducer_path = "#{PATH}/redux/reducers/#{name}.js"
File.open(reducer_path, "w") { |file| file.puts new_reducer }


# redux/reducers/index.js -----------------------------------------------------
add_import = ["import #{name} from './#{name}'", "//[+add_import+]"]
add_reducer = ["#{name},", "//[+add_reducer+]"]
index_path = "#{PATH}/redux/reducers/index.js"
index_file = File.read(index_path)
index_file = index_file.gsub("//[+add_import+]", add_import.join("\n"))
index_file = index_file.gsub("//[+add_reducer+]", add_reducer.join("\n\t"))
File.open(index_path, "w") { |file| file.puts index_file }


# redux/actions.js ------------------------------------------------------------
add_action = ["export const set#{name.capitalize} = #{name} => { return { type: 'SET_#{name.upcase}', #{name} } }", "//[+add_action+]"]
action_path = "#{PATH}/redux/actions.js"
action_file = File.read(action_path)
action_file = action_file.gsub("//[+add_action+]", add_action.join("\n"))
File.open(action_path, "w") { |file| file.puts action_file }


# redux/state.js --------------------------------------------------------------
add_state = ["#{name}: [],", "//[+add_state+]"]
state_path = "#{PATH}/redux/state.js"
state_file = File.read(state_path)
state_file = state_file.gsub("//[+add_state+]", add_state.join("\n\t"))
File.open(state_path, "w") { |file| file.puts state_file }


