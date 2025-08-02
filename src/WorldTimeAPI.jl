module WorldTimeAPI

using Dates
using HTTP
using JSON

function fetch(timezone::AbstractString)
    response = HTTP.get("https://worldtimeapi.org/api/timezone/$timezone")
    body = String(response.body)
    return JSON.parse(body)
end

function datetime(timezone::AbstractString = "Etc/UTC")
    time = fetch(timezone)
    format = dateformat"yyyy-mm-ddTHH:MM:SS"
    return DateTime(time["datetime"][1:19], format)
end

end
