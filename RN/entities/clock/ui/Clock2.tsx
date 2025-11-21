import {Text, View} from "react-native";
import {useClock} from "@/entities/clock/model/useClock";

export function Clock() {

    const {time, hourDegree, minuteDegree, secondDegree} = useClock();

    return (
        <>
            <Text>{time.toLocaleTimeString()}</Text>

            <View className={"relative w-5/6 aspect-square border rounded-full bg-white flex justify-center items-center"}>
                <View className={'w-full h-full flex justify-center items-center'}>
                    <View className={'absolute top-0 left-0 w-full h-full flex justify-center items-center z-10'}>
                        <View className={'w-11/12 aspect-square rounded-full bg-white'} />
                    </View>

                    <View className={'absolute top-0 left-0 w-full h-full flex justify-center items-center z-30'}>
                        <View className={'w-10/12 aspect-square rounded-full bg-white'} />
                    </View>

                    {Array.from({length: 60}).map((_, i) => {
                        const degree = i * 6;

                        if (degree % 30 === 0) {
                            return <View key={i} className={`absolute left-0 w-full h-1 bg-black z-20`} style={{
                                transform: [
                                    {rotate: `${degree}deg`}
                                ]
                            }}/>
                        }else {
                            return <View key={i} className={`absolute left-0 w-full border border-gray-600`} style={{
                                transform: [
                                    {rotate: `${degree}deg`}
                                ]
                            }}/>
                        }
                    })}

                    {/*중앙*/}
                    <View className={'w-4 h-4 bg-black rounded-full z-40'}/>

                    {/*시침*/}
                    <View
                        className="absolute top-0 left-0 w-full h-full flex justify-center z-40"
                        style={{
                            transform: [
                                {rotate: `${hourDegree}deg`}
                            ],
                        }}
                    >
                        <View className={'w-1/2 flex justify-center'}>
                            <View className={'w-1/4 h-2 bg-black border absolute right-0'}/>
                        </View>
                    </View>

                    {/*분침*/}
                    <View
                        className="absolute top-0 left-0 w-full h-full flex justify-center z-40"
                        style={{
                            transform: [
                                {rotate: `${minuteDegree}deg`}
                            ],
                        }}
                    >
                        <View className={'w-1/2 flex justify-center'}>
                            <View className={'w-1/2 h-1 bg-black border absolute right-0'}/>
                        </View>
                    </View>

                    {/*초침*/}
                    <View
                        className={`absolute top-0 left-0 w-full h-full flex justify-center z-40`}
                        style={{
                            transform: [
                                {rotate: `${secondDegree}deg`}
                            ],
                        }}
                    >
                        <View className={'w-1/2 flex justify-center'}>
                            <View className={'w-3/4 border border-red-600 absolute right-0'}/>
                        </View>
                    </View>
                </View>

            </View>
        </>
    )
}