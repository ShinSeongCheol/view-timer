import { View, Text } from "react-native";
import {Clock} from "@/entities/clock";

export function Home() {
    return(
        <View className={'h-full flex flex-col justify-center items-center'}>
            <Text className={''}>View Timer</Text>

            <Clock />
        </View>
    );
}