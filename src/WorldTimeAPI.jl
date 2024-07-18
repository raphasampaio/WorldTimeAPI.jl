module WorldTimeAPI

using Dates
using HTTP
using JSON

function datetime(timezone::AbstractString = "Etc/UTC")
    response = HTTP.get("http://worldtimeapi.org/api/timezone/$timezone")
    if response.status != 200
        error("Failed to get time from NTP server")
    end

    body = String(response.body)
    json = JSON.parse(body)
    if !haskey(json, "utc_datetime")
        error("Failed to get time from NTP server")
    end

    format = dateformat"yyyy-mm-ddTHH:MM:SS"
    return DateTime(json["utc_datetime"][1:19], format)
end

end
