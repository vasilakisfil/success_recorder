require 'spec_helper'

describe SuccessRecorder do
  before do
    @redis = Redis.new
  end

  it 'has a version number' do
    expect(SuccessRecorder::VERSION).not_to be nil
  end

  context 'for single key' do
    describe 'when user has various success and failures...' do
      before do
        SuccessRecorder.success!('foo')
        SuccessRecorder.failure!('foo')
        SuccessRecorder.success!('foo')
      end

      it 'sets the correct ratios' do
        expect(SuccessRecorder.report('foo')).to eq 2.to_f/3.to_f
        expect(@redis.hgetall('foo')).to eq({'successes' => '2', 'total' => '3'})
      end
    end
  end

  context 'for multiple keys' do
    describe 'when user has various success and failures...' do
      before do
        SuccessRecorder.success!('foo1', 'foo2')
        SuccessRecorder.success!('foo1', 'foo2')
        SuccessRecorder.failure!('foo1', 'foo2')
      end

      it 'sets the correct ratios' do
        expect(SuccessRecorder.report('foo1', 'foo2')).to eq 2.to_f/3.to_f
        expect(@redis.hgetall('foo1:foo2')).to eq({'successes' => '2', 'total' => '3'})
      end
    end
  end
end
