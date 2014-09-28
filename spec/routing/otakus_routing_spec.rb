require 'rails_helper'

RSpec.describe OtakusController, :type => :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/otakus').to route_to('otakus#index')
    end

    it 'routes to #show' do
      expect(:get => '/otakus/1').to route_to('otakus#show', :id => '1')
    end

    it 'routes to #rate_anime' do
      expect(:post => '/otakus/1/rate/2').to route_to('otakus#rate_anime', :id => '1')
    end

    it 'routes to lists' do
      expect(:post => '/otakus/1/watch/2').to route_to('otakus#add_to_watch_list', :id => '1',:anime_id => '2')
      expect(:post => '/otakus/1/watched/2').to route_to('otakus#add_to_watched_list', :id => '1',:anime_id => '2')
      expect(:post => '/otakus/1/watching/2').to route_to('otakus#add_to_watching_list', :id => '1',:anime_id => '2')

      expect(:delete => '/otakus/1/watch/2').to route_to('otakus#remove_from_watch_list', :id => '1',:anime_id => '2')
      expect(:delete => '/otakus/1/watched/2').to route_to('otakus#remove_from_watched_list', :id => '1',:anime_id => '2')
      expect(:delete => '/otakus/1/watching/2').to route_to('otakus#remove_from_watching_list', :id => '1',:anime_id => '2')
    end

  end
end
