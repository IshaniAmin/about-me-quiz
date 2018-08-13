def calculate_result(point_total)
    if point_total >= 30
        return "bffs"
    elsif point_total > 15 && point_total < 30
        return "ok"
    else
        return "nope"
    end
end