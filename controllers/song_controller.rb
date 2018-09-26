class App < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  #Setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory correctly
  set :views, Proc.new{File.join(root,"views")}
  # Creates array
  $music = [
    {
      :id => 1,
      :track => "Last Surprise",
      :artist => "Shoji Meguro",
      :game => "Persona 5",
      :release => "2016",
    },
    {
      :id => 2,
      :track => "Condemned Tower",
      :artist => "Michiru Yamane",
      :game => "Castlevania: Dawn of Sorrow",
      :release => "2005",

    },
    {
      :id => 3,
      :track => "Jump Up, Super Star",
      :artist => "Koji Kondo",
      :game => "Super Mario Odyssey",
      :release => "2018",
    }
  ]

  #=== INDEX ===
  get '/music' do
    # defines local var music
    @music = $music
    # calls index.erb
    erb :'music/index'
  end
  #=== NEW ===
  get '/music/new' do
    # calls new.erb
    erb :'music/new'
  end
  #=== SHOW ===
  get '/music/:id' do
    # gets id of value
    id = params[:id].to_i
    # defines local var music
    @music = $music[id-1]
    # calls display.erb
    erb :'music/display'
  end

  #=== EDIT ===
  get '/music/:id/edit' do
    # gets id of value
    id = params[:id].to_i
    # defines local var music
    @music = $music[id-1]
    # calls edit.erb
    erb :'music/edit'
  end

  #=== CREATE ===
  post '/music' do
  # creates id var
  id = $music.length + 1
  #sets values for new track hash to values from new.erb
  newTrack = {
    :id => id,
    :track => params[:track],
    :artist => params[:artist],
    :game => params[:game],
    :release => params[:release]
  }
  # pushes new hash into global var music
  $music.push(newTrack)
  puts $music
  # redirects page to index page
  redirect '/music'
  end
  #=== UPDATE ===
  put '/music/:id' do
    # creates id var
    id = (params[:id].to_i) - 1
    # creates music var
    music = $music[id]
    # changes values of track with those from edit.erb
    music[:track] = params[:track]
    music[:artist] = params[:artist]
    music[:game] = params[:game]
    music[:release] = params[:release]
    # saves changes to global var music
    $music[id] = music
    redirect '/music'
  end
  #=== DESTROY ===
  delete '/music/:id' do
    # creates id var
    id = params[:id].to_i
    # deletes item at array index value of id
    $music.delete_at id
    redirect '/music'
  end

end

# edits to make:
# change intro page with images with a tag links
