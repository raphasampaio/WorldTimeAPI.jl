module WorldTimeAPI

using Dates
using HTTP
using JSON

function fetch(timezone::AbstractString)
    for i in 1:10
        try
            response = HTTP.get("https://worldtimeapi.org/api/timezone/$timezone")
            body = String(response.body)
            return JSON.parse(body)
        catch e
            i == 10 ? rethrow(e) : sleep(i)
        end
    end
end

function datetime(timezone::AbstractString = "Etc/UTC")
    time = fetch(timezone)
    format = dateformat"yyyy-mm-ddTHH:MM:SS"
    return DateTime(time["datetime"][1:19], format)
end

end
