module WorldTimeAPI

using Dates
using HTTP
using JSON

function fetch(timezone::AbstractString)
    response = HTTP.get("http://worldtimeapi.org/api/timezone/$timezone")
    if response.status != 200
        error("Failed to get time from NTP server")
    end

    body = String(response.body)
    return JSON.parse(body)
end

function datetime(timezone::AbstractString = "Etc/UTC")
    time = fetch(timezone)

    if !haskey(time, "datetime")
        error("Failed to get time from NTP server")
    end

    format = dateformat"yyyy-mm-ddTHH:MM:SS"
    return DateTime(time["datetime"][1:19], format)
end

end
