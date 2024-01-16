import {PrismaClient} from '@prisma/client'
import {parametersConfig, staticPilotParameters} from "./pilotConfigManager";

const prisma = new PrismaClient()

async function addStaticParam(values: staticPilotParameters, voileId: number) {
    return prisma.staticParameters.upsert({where:{voileId: voileId}, update: {voileId: voileId, ...values}, create: {voileId: voileId, ...values}})
}

async function retrieveStaticParam(voileId: number) {
    return prisma.staticParameters.findUnique({where:{voileId: voileId}})
}

function validateStaticParameters(values: staticPilotParameters){
    //iterate over values
    //check if value is in the range of the parameter
    for (const key in values) {
        const value = values[key as keyof staticPilotParameters];
        const config = parametersConfig[key as keyof typeof parametersConfig];
        if(value < config.min || value > config.max){
            console.log("Invalid value for parameter " + key + ": " + value);
            return false;
        }

    }
    return true;
}

async function main() {

    //If no voile 1 exists, create it
    const voile = await prisma.voile.upsert({where:{id: 1}, update: {name: "voile1"}, create: {name: "voile1"}});
    console.log(voile)


    const allStaticPilot = await prisma.staticParameters.findMany()
    console.log("All static pilots", allStaticPilot)

    //generate random values
    const values: staticPilotParameters = {
        kp_elevation: Math.random(),
        ki_elevation: Math.random(),
        kd_elevation: Math.random(),
        kp_lacet: Math.random(),
        ki_lacet: Math.random(),
        kd_lacet: Math.random(),
    }
    const isValid = validateStaticParameters(values);
    if(!isValid){
        console.log("Invalid values");
        return;
    }
    console.log("Valid values");
    const voileId = 1;
    const staticParam = await addStaticParam(values, voileId);
    console.log(staticParam);

}

main()
    .catch(e => {
        throw e
    })
    .then(async () => {
        await prisma.$disconnect()
    })

