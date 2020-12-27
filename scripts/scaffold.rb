require 'fileutils'

singular = ARGV.shift
plural = ARGV.shift
up_singular = singular.capitalize
up_plural = plural.capitalize

table_heads = []
table_data  = []
show_fields = []
edit_fields = []
lookup_data = []

ARGV.each do |field|
  options = field.split(":")
  name = options.shift
  label = name.split("_").map(&:capitalize).join(" ")
  type = options.shift

  table_heads.push("'#{label}', ")
  table_data.push("#{singular}.#{name},")
  show_fields.push("<h4 className={classes.cardTitle}>#{label}: {#{singular}.#{name}}</h4>")
  
  if(options.include?("searchable"))
    lookup_data.push("item.#{name}.toLowerCase().includes(lookup)")
  end

  if !type || type == "string"
    edit_fields.push(
      """
        <GridContainer>
          <GridItem xs={12} sm={12} md={4}>
            <CustomInput
              labelText='#{label}'
              id='#{name}'
              formControlProps={{ fullWidth: true }}
              inputProps={{
                onChange,
                name: '#{name}',
                value: #{singular}.#{name}
              }}
            />
          </GridItem>
        </GridContainer>
      """
    )
  end
  
  if type == "list"
    edit_fields.push(
      """
        <GridContainer>
          <GridItem xs={12} sm={12} md={4}>
            <CustomSelect
              labelText='#{label}'
              id='#{name}'
              formControlProps={{ fullWidth: true }}
              values={ _#{name} }
              onChange={onChange}
              inputProps={{
                name: '#{name}',
                value: #{singular}.#{name}
              }}
            />
          </GridItem>
        </GridContainer>
      """
    )
  end
  
  if type == "text"
    edit_fields.push(
      """
        <GridContainer>
          <GridItem xs={12} sm={12} md={12}>
            <CustomInput
              labelText='#{label}'
              id='#{name}'
              formControlProps={{ fullWidth: true }}
              inputProps={{
                onChange,
                multiline: true,
                rows: 5,
                name: '#{name}',
                value: #{singular}.#{name} || ""
              }}
            />
          </GridItem>
        </GridContainer>
      """
    )
  end
end

table_heads.push("'Actions'")


# PATH ------------------------------------------------------------------------
PATH = '../../material-react/src'

# VIEWS ----------------------------------------------------------------

# FileUtils.mkdir_p("#{PATH}/views/#{up_plural}")
# filenames = ["Edit", "Fields", "Form", "List", "New", "Show"]
# filenames.each do |filename|
#   output = File.open("#{PATH}/views/#{up_plural}/#{up_singular}#{filename}.js", "a")
#   File.foreach("../scaffold/#{filename}.js") do |line|
#     line = line.gsub("[+singular+]", singular)
#     line = line.gsub("[+plural+]", plural)
#     line = line.gsub("[+up_singular+]", up_singular)
#     line = line.gsub("[+up_plural+]", up_plural)
#     line = line.gsub("[+show_fields+]", show_fields.join("\n\t\t\t\t"))
#     line = line.gsub("[+edit_fields+]", edit_fields.join("\n"))
#     line = line.gsub("[+table_heads+]", table_heads.join(""))
#     line = line.gsub("[+table_data+]",  table_data.join("\n\t\t\t\t\t\t\t\t\t\t\t"))
#     line = line.gsub("[+lookup_data+]", lookup_data.join(" || \n\t\t\t\t\t"))
#     output.write(line)
#   end
#   output.close
# end


# ROUTES -----------------------------------------------------------------

# filenames = ["Edit", "List", "New", "Show"]
# 
# new_includes = ["// #{plural} imports"]
# filenames.each do |filename|
#   new_includes.push("import #{up_singular}#{filename} from 'views/#{up_plural}/#{up_singular}#{filename}.js'")
# end
# new_includes.push("//[+add_includes+]")
# 
# new_routes = """
#   // #{plural} routes
#   { path: '/#{plural}/new',      component: #{up_singular}New,  layout: '', hidden: true },
#   { path: '/#{plural}/:id/edit', component: #{up_singular}Edit, layout: '', hidden: true },
#   { path: '/#{plural}/:id',      component: #{up_singular}Show, layout: '', hidden: true },
#   { path: '/#{plural}',          component: #{up_singular}List, layout: '', name: '#{up_plural}', icon: Dashboard },
#   //[+add_routes+]
# """
# 
# routes_path = "#{PATH}/routes.js"
# routes_file = File.read(routes_path)
# routes_file = routes_file.gsub("//[+add_includes+]", new_includes.join("\n"))
# routes_file = routes_file.gsub("//[+add_routes+]", new_routes)
# File.open(routes_path, "w") { |file| file.puts routes_file }



# VARIABLES/GENERAL ----------------------------------------------------------

# add_default = ["// default #{singular} export", "const default#{up_singular} = {"]
# ARGV.each do |field|
#   options = field.split(":")
#   name = options.shift
#   #type = options.shift
#   # missing default type depending on type value
#   add_default.push("#{name}: '',")
# end
# add_default.push("}")
# add_default.push("//[+add_default+]")
# 
# export_default = ["default#{up_singular},", "//[+export_default+]"]
# 
# variables_path = "#{PATH}/variables/general.js"
# variables_file = File.read(variables_path)
# variables_file = variables_file.gsub("//[+add_default+]", add_default.join("\n"))
# variables_file = variables_file.gsub("//[+export_default+]", export_default.join("\n"))
# File.open(variables_path, "w") { |file| file.puts variables_file }




