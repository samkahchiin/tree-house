require 'rails_helper'

describe Booking, type: :model do
  describe "validation" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:mobile) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:no_of_adults) }
    it { is_expected.to validate_presence_of(:trip_type) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:backup_date_1) }
    it { is_expected.to validate_presence_of(:backup_date_2) }
  end
end
