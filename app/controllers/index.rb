get '/' do
  @categories = Category.all
  erb :index
end

get '/categories/:id' do
  @category_id = params[:id]
  @category_title = Category.find(@category_id).title
  @postings = Posting.where(category_id: @category_id)

  if post_exists?
    @last_post = 1
  else
    @last_post = Posting.all.last.id + 1
  end

  erb :postings
end

get '/postings/:category_id/:id' do
  @category_id = params[:category_id]
  @post = Posting.find(params[:id])
  @category_title = Category.find(@category_id).title
  erb :single_post
end

post '/postings/create/new/:category/:post' do
  @post_title = params[:posting][:title]
  @post_body = params[:posting][:body]
  @category_id = params[:category]
  @post_price = params[:posting][:price]
  @post_location = params[:posting][:location]
  @category_title = Category.find(@category_id)[:title]

  post = Posting.create(title: @post_title, body: @post_body, category_id: params[:category], price: @post_price, location: @post_location)

  @post_id = post[:id]

  # erb :new_post
  redirect "/postings/#{post.slug}"
end

# get '/postings/create/new/:category/:post' do
get '/postings/:post_slug' do 
  @post_id = Posting.find_by_slug(params[:post_slug]).id
  post = Posting.find(@post_id)

  @post_title = post.title
  @post_body = post.body
  @post_price = post.price
  @post_location = post.location
  # @post_id = params[:post]

  # @category_id = params[:category]
  @category_id = post.category_id
  @category_title = Category.find(@category_id).title

  erb :new_post
end

delete '/delete/:category_id/:post_id' do
  Posting.find(params[:post_id]).destroy
  redirect '/'
end

put '/update/:category_id/:post_id' do
  @category_id = params[:category_id]
  @post_id = params[:post_id]
  @post = Posting.find(@post_id)
  @post.update_attributes title: params[:title], body: params[:body], category_id: @category_id, location: params[:location], price: params[:price]
  
  @category_title = Category.find(@category_id).title
  erb :single_post
end
