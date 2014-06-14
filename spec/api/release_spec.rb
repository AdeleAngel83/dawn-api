require_relative '../api_spec_helper.rb'

describe Dawn::Release do
  let(:release) { Dawn::Release }

  context ".find" do
    it "should find 1 release by id" do
      release.find id: 1
    end
  end

  ## releases cannot be destroyed
  #context "#destroy" do
  #  it "should destroy 1 release by id" do
  #    release.destroy id: 1
  #  end
  #end
end
