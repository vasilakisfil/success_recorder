class SuccessRecorder::Adapter
  attr_reader :key

  def initialize(keys)
    @key = normalize_params(keys)
  end

  def success
    increase_sucesses(key)
    increase_total(key)
  end

  def failure
    increase_total(key)
  end

  def report
    data = Redis::HashKey.new(key).all
    data['successes'].to_f / data['total'].to_f
  end

  private
    def increase_sucesses(key)
      Redis::HashKey.new(key).incr('successes', 1)
    end

    def increase_total(key)
      Redis::HashKey.new(key).incr('total', 1)
    end

    def normalize_params(keys)
      case key
      when Array
        return keys.join(':')
      else
        return key.to_s
      end
    end
end
