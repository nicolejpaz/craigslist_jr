get '/' do
  @categories = Category.all
  erb :index
end

get '/categories/:id' do
  @category_id = params[:id]
  @category_title = Category.find(@category_id).title
  p @category_title
  p @category_id
  @postings = Posting.where(category_id: @category_id)

  erb :postings
end

get '/postings/:category_id/:id' do
  @category_id = params[:category_id]
  @post = Posting.find(params[:id])
  @category_title = Category.find(@category_id).title

  erb :single_post
end

post '/postings/create/new/:category' do
  @post_title = params[:posting][:title]
  @post_body = params[:posting][:body]
  @category_id = params[:category]
  @post_price = params[:posting][:price]
  @post_location = params[:posting][:location]
  @category_title = Category.find(@category_id)[:title]

  post = Posting.create(title: @post_title, body: @post_body, category_id: params[:category], price: @post_price, location: @post_location)

  @post_id = post.id

  redirect "/postings/#{post.slug}"
end

get '/postings/:post_slug' do 
  @post_id = Posting.find_by_slug(params[:post_slug]).id
  @post = Posting.find(@post_id)
  @category_id = @post.category_id
  @category_title = Category.find(@category_id).title

  erb :new_post
end

delete '/delete/:category_id/:post_id' do
  Posting.find(params[:post_id]).destroy
  redirect '/'
end

put '/update/:category_id/:post_id' do
  @category_id = params[:category_id]
  @category_title = Category.find(@category_id).title

  @post_id = params[:post_id]
  @post = Posting.find(@post_id)
  @post.update_attributes title: params[:title], body: params[:body], category_id: @category_id, location: params[:location], price: params[:price]

  erb :single_post
end
