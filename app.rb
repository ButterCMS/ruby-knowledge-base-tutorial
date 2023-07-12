require 'sinatra'
require 'net/http'
require 'json'


set :public_folder, File.join(File.dirname(__FILE__), 'public')



get '/' do
  uri = URI('https://api.buttercms.com/v2/pages/drop_knowledge_base/?auth_token=d069fccfe1638973ea0a218b96081b3e04f1b406') # Replace with your API endpoint
  response = Net::HTTP.get(uri)
  data = JSON.parse(response)
  erb :index, locals:{data: data}

end

get '/detail/:slug' do
  slug = params[:slug]
  uri = URI('https://api.buttercms.com/v2/pages/drop_knowledge_base/' + slug + '/?auth_token=d069fccfe1638973ea0a218b96081b3e04f1b406') # Replace with your API endpoint
  response = Net::HTTP.get(uri) 
  data = JSON.parse(response)
  puts data

  erb :detail, locals:{data:data}
end



get '/filter' do
  slug = params[:dropdown]

  uri = URI('https://api.buttercms.com/v2/pages/drop_knowledge_base/?&fields.category.slug=' + slug + '&auth_token=d069fccfe1638973ea0a218b96081b3e04f1b406') # Replace with your API endpoint
  response = Net::HTTP.get(uri) 
  data = JSON.parse(response)
  puts data
   erb :filter,locals:{data:data, slug:slug}
  end
  

  


