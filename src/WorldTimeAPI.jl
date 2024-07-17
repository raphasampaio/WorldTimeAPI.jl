module WorldTimeAPI

using Dates
using HTTP
using JSON

function datetime(timezone::AbstractString = "Etc/UTC")
    response = HTTP.get("http://worldtimeapi.org/api/timezone/$timezone")
    if response.status != 200
        error("Failed to get time from NTP server")
    end

    response_text = String(response.body)
    data = JSON.parse(response_text)
    if !haskey(data, "utc_datetime")
        error("Failed to get time from NTP server")
    end

    utc_datetime = data["utc_datetime"][1:19]
    return DateTime(utc_datetime, dateformat"yyyy-mm-ddTHH:MM:SS")
end

end