function conv(a,b)
    acc = 0.0*b[1,1]
    (n,_) = size(a)
    for i ∈ 1:n
        for j ∈ 1:n
            acc = acc + a[i,j]*b[i,j]
        end
    end
    return abs.(acc)
end

function convolve(image, kernel)
    kernel = collect(kernel)
    (h,w) = size(image)
    (a,_) = size(kernel)
    n     = convert(Int64,(a-1)/2)    
    newimage = copy(image)
    for i ∈ 1:w
        for j ∈ 1:h

            if (1 <= (i-n)) && ((i+n) <= w) && (1 <= (j-n)) && ((j+n) <= h)
                t = (j-n)
                b = (j+n)
                l = (i-n)
                r = (i+n)
                newimage[j,i] =  conv( kernel, image[t:b,l:r] )
            end

            #add edge cases here

        end
    end
    return newimage
end