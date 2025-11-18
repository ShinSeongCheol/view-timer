import {useEffect, useState} from "react";

export function useClock() {
    const [time, setTime] = useState(new Date());

    useEffect(() => {
        const timer = setInterval(() => {
            setTime(new Date());
        }, 1000);

        return () => clearInterval(timer);
    }, []);

    const seconds = time.getSeconds();
    const minutes = time.getMinutes();
    const hours = time.getHours();


    const secondDegree = seconds * 6 + 90;
    const minuteDegree = minutes * 6 + seconds * 0.1 + 90;
    const hourDegree = (hours % 12) * 30 + minutes * 0.5 + 90;

    return {time, hourDegree, minuteDegree, secondDegree};
}