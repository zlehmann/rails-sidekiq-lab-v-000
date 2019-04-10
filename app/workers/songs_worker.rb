class SongsWorker
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(params[:file].path, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end
