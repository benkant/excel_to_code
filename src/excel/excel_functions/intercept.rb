module ExcelFunctions
  # ys: y samples, xs: x samples
  def intercept(*args)
    return :error if args.size != 2
    ys = args[0]
    xs = args[1]
    ys.flatten! if ys[0].respond_to?('find') 
    xs.flatten! if xs[0].respond_to?('find') 
    return :error if !ys.respond_to?('find')
    return :error if !xs.respond_to?('find')
    return :error if ys.size < 2 || ys.size != xs.size
    error = ys.find {|ax| !ax.is_a?(Numeric) }
    return :error if error
    error = xs.find {|bx| !bx.is_a?(Numeric) }
    return :error if error
    
    # sample means
    ym = ys.inject{ |sum, el| sum + el }.to_f / ys.size
    xm = xs.inject{ |sum, el| sum + el }.to_f / xs.size

    # slope b = (sum(x-xm)(y-ym))/sum((x-xm)^2)
    # delta y from sample mean
    dysm = ys.map { |y| y - ym }
    # delta x from sample mean
    dxsm = xs.map { |x| x - xm }
    # product of delta x and delta y from sample mean
    pdyxsm = []
    (0..dysm.size-1).each do |i|
        pdyxsm.push(dysm[i] * dxsm[i])
    end
    # delta x from sample mean squared
    dxsmsq = dxsm.map { |dx| dx * dx }
    # sum pdyxsm
    spdyxsm = pdyxsm.inject{ |sum, el| sum + el }
    # sum dxsmsq
    dxsmsq = dxsmsq.inject{ |sum, el| sum + el } 

    return :value if dxsmsq == 0

    # slope b
    b = spdyxsm/dxsmsq
    # intercept a = ym -b * xm
    ym - b * xm
  end
  
end
