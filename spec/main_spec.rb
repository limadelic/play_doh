require 'spec_helper'

describe 'on the main object' do

  it 'should stub global functions' do

    play_doh main
    main.global.should be nil

  end

end