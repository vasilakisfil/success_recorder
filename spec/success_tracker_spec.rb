require 'spec_helper'

describe SuccessRecorder do
  it 'has a version number' do
    expect(SuccessRecorder::VERSION).not_to be nil
  end

  context 'for single key' do
    describe 'when user has various success and failures...' do
      before do
        SuccessRecorder.success!('foo')
      end

      it 'sets the correct ratios' do
        expect(SuccessRecorder.report('foo')).to eq 1
      end
    end
  end
end
