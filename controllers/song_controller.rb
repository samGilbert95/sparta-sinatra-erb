class App < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  #Setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory correctly
  set :views, Proc.new{File.join(root,"views")}

  $music = [
    {
      :name => ""
      :artist => "",
      :album => "",
      :release => "",
      :track => ""
    },
    {
      :name => ""
      :artist => "",
      :album => "",
      :release => "",
      :track => ""
    },
    {
      :name => ""
      :artist => "",
      :album => "",
      :release => "",
      :track => ""
    }
  ]

  #=== INDEX ===
  get music do

  end
  #=== SHOW ===
  get music do

  end
  #=== EDIT ===
  get music do

  end
  #=== NEW ===
  get music do

  end
  #=== CREATE ===
  post music do

  end
  #=== UPDATE ===
  put music do

  end
  #=== DESTROY ===
  delete music do

  end

end
