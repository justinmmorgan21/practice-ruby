class Bowler
  attr_reader(:scores)
  def initialize
    @scores = []
  end

  def add_score(frame)
    
    @scores << frame
  end

  def total_score
    score = 0
    i = 0
    while i < @scores.length
      score += @scores[i].sum
      # look back at frame before
      # check if the array is length 1 - means strike
      # check else if the sum is 10 - means spare
      if i > 0 && @scores[i - 1].length == 1
        score += @scores[i].sum
      elsif i > 0 && @scores[i - 1].sum == 10
        score += @scores[i][0]
      end

      i += 1
    end
    return score
  end
end

def one_frame(bowler, frame_num)
  if frame_num == 10
    # DEFINE FRAME 10
    roll_one = rand(0..10)
    frame = [roll_one]
    if roll_one == 10 # 2 bowls left
      
    else # roll_one is less than 10, 1 bowl left
      # Subtract the number of pins from 10
      pins_left = 10 - roll_one
      
      # Roll ball 2, generating a random number from 1 to number of pins left
      frame << rand(0..pins_left)
      bowler.add_score(frame)
    end
    return
  end

  # Roll ball 1, generating a random number from 1 to 10
  roll_one = rand(0..10)
  frame = []
  if roll_one == 10
    frame = [10]
    bowler.add_score(frame)
  else
    # Subtract the number of pins from 10
    pins_left = 10 - roll_one
    
    # Roll ball 2, generating a random number from 1 to number of pins left
    roll_two = rand(0..pins_left)
    frame = [roll_one, roll_two]
    bowler.add_score(frame)
  end
  return
end

bowlers = []
num_bowlers = 2
(1..num_bowlers).each {
  bowlers << Bowler.new
}

# bowl 10 frames
i = 1
while i <= 3
  bowlers.each { |bowler|
    one_frame(bowler, i)
  }
  i += 1
end

bowlers.each { |bowler|
  pp bowler.scores
  pp bowler.total_score
}
# report the total score

