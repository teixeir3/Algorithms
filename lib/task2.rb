 # -(a.join.to_i(2))
 a = [1,0,0,1,1]
 bits = []
  a.each_with_index do |bit, i|
    bits << bit*((-2)**i)
  end
  
  changed_bits = bits.map { |el| -el }
  
  number = -(bits.inject(:+))
  
  p changed_bits
  p number
  
  
  # you can write to stdout for debugging purposes, e.g.
  # puts "this is a debug message"

  def solution(a)
    # write your code in Ruby 2.2
  
    return 0 if a.empty?
  
    # decode
    bits = []
    a.each_with_index do |bit, i|
      bits << bit*((-2)**i)
    end
  
    changed_bits = bits.map { |el| -el }
    answer = []
    changed_bits.each_with_index do |changed_bit, i|
      answer
    end
    # number = bits.inject(:+)
  
    # change number
    # number = -number
  
    # encode
 
  end

  def decode(a)
    bits = []
    a.each_with_index do |bit, i|
      bits << bit*((-2)**i)
    end
    number = bits.inject(:+)
  end
  
  #
  # <div id="brinza-task-description" class="protected">
  # <p>In base −2, integers are represented by sequences of bits in the following way. Bits are ordered from the least to the most significant. Sequence B of N bits represents the number: <b>sum</b>{ B[i]*(−2)<sup>i</sup>  for  i = 0..N−1 }. The empty sequence represents 0.</p>
  # <p>Note that such a representation is suitable for both positive and negative integers.</p>
  # <p>Write a function:</p>
  # <blockquote><p class="lang-rb" style="font-family: monospace; font-size: 9pt; display: block; white-space: pre-wrap"><tt>def solution(a)</tt></p></blockquote>
  # <p>that, given a zero-indexed array A of M bits, containing a sequence representing some integer X, returns the shortest sequence of bits representing −X.</p>
  # <p>The sequence should be returned as:</p>
  # <blockquote><ul style="margin: 10px;padding: 0px;"><li>a structure <tt style="white-space:pre-wrap">Results</tt> (in C), or</li>
  # <li>a vector of integers (in C++), or</li>
  # <li>a record <tt style="white-space:pre-wrap">Results</tt> (in Pascal), or</li>
  # <li>an array of integers (in any other programming language).</li>
  # </ul>
  # </blockquote><p>For example, given A = [1,0,0,1,1] (X = 9), the function should return [1,1,0,1] (−X = −9). Given A = [1,0,0,1,1,1] (X = −23), the function should return [1,1,0,1,0,1,1] (−X = 23).</p>
  # <p>Assume that:</p>
  # <blockquote><ul style="margin: 10px;padding: 0px;"><li>M is an integer within the range [<span class="number">0</span>..<span class="number">100,000</span>];</li>
  # <li>each element of array A is an integer that can have one of the following values: 0, 1.</li>
  # </ul>
  # </blockquote><p>Complexity:</p>
  # <blockquote><ul style="margin: 10px;padding: 0px;"><li>expected worst-case time complexity is O(M);</li>
  # <li>expected worst-case space complexity is O(M), beyond input storage (not counting the storage required for input arguments).</li>
  # </ul>
  # </blockquote><p>Elements of input arrays can be modified.</p>
  # </div>