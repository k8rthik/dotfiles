"use strict";var m=Object.defineProperty;var f=Object.getOwnPropertyDescriptor;var S=Object.getOwnPropertyNames;var v=Object.prototype.hasOwnProperty;var b=(i,t)=>{for(var o in t)m(i,o,{get:t[o],enumerable:!0})},P=(i,t,o,e)=>{if(t&&typeof t=="object"||typeof t=="function")for(let r of S(t))!v.call(i,r)&&r!==o&&m(i,r,{get:()=>t[r],enumerable:!(e=f(t,r))||e.enumerable});return i};var x=i=>P(m({},"__esModule",{value:!0}),i);var U={};b(U,{default:()=>A});module.exports=x(U);var p=require("child_process"),h=require("util"),n=(0,h.promisify)(p.exec);function y(i,t){let o=new Map;for(let e of i){let r=t(e),c=o.get(r);c?c.push(e):o.set(r,[e])}return Array.from(o.keys()).map(e=>({key:e,values:o.get(e)??[]}))}var g=require("@raycast/api"),u=class i{static get bundleIdentifier(){return"com.apple.dt.Xcode"}static get downloadUrl(){return"https://apps.apple.com/app/id497799835"}static get developerDocumentationURLScheme(){return"x-xcode-documentation://"}static async isXcodeInstalled(){return!!(await(0,g.getApplications)()).find(o=>o.bundleId===i.bundleIdentifier)}static async isXcodeRunning(){try{return(await n("pgrep Xcode")).stdout.trim().length!==0}catch{return!1}}static launchXcode(){return n([`open -j -b ${i.bundleIdentifier}`,"sleep 2"].join(" && ")).then()}};var a=class extends Error{constructor(o){super(o);this.reason=o}};var l=class i{static launchSimulatorApplication(){return n('open -b "com.apple.iphonesimulator"').then()}static async xcodeSimulatorGroups(t){let o=await i.xcodeSimulators();return y(o.filter(e=>t==="All"||e.state===t),e=>e.runtime).map(e=>({runtime:e.key,simulators:e.values})).sort((e,r)=>e.runtime.localeCompare(r.runtime))}static async xcodeSimulators(){let t=await n("xcrun simctl list -j -v devices"),o=JSON.parse(t.stdout);if(!o||!o.devices)throw[];let e=[];for(let r in o.devices){let c=r.substring(r.lastIndexOf(".")+1).split("-"),w=[c.shift(),c.join(".")].join(" ");e.push(...o.devices[r].map(d=>(d.runtime=w,d)))}return e}static boot(t){return n(`xcrun simctl boot ${t.udid}`).then(()=>{i.launchSimulatorApplication()})}static shutdown(t){return n(`xcrun simctl shutdown ${t.udid}`).then()}static toggle(t){switch(t.state){case"Booted":return i.shutdown(t);case"Shutting Down":return Promise.resolve();case"Shutdown":return i.boot(t)}}static async restart(t){await i.shutdown(t),await i.boot(t)}static async app(t,o,e){try{await i.boot(e)}catch{}return n(["xcrun","simctl",t,e.udid,o].join(" ")).then()}static async appPrivacy(t,o,e,r){try{await i.boot(r)}catch{}return n(["xcrun","simctl","privacy",r.udid,t,o,e].join(" ")).then()}static isValidUrl(t){return/\w+:\/\/+/.test(t)}static async openUrl(t,o){let e=t.trim();if(!i.isValidUrl(e))throw new a("Bad Url");if(!o){if(!await u.isXcodeInstalled())throw new a("Xcode is not installed");if(!(await i.xcodeSimulators()).some(c=>c.state==="Booted"))throw new a("No simulator booted")}return n(["xcrun","simctl","openurl",o?.udid??"booted",e].join(" ")).then(()=>{i.launchSimulatorApplication()})}static async sendPushNotification(t,o,e){return n(`xcrun simctl push ${t.udid} ${o} ${e}`).then()}static async deleteAppFiles(t,o){let e=o?n(`rm -rf ${o}`):Promise.resolve();return Promise.all([n(`rm -rf ${t}`),e]).then()}static async rename(t,o){return n(`xcrun simctl rename ${t.udid} '${o}' `).then()}static async triggerIcloudSync(t){return n(`xcrun simctl icloud_sync ${t.udid}`).then()}};var s=require("@raycast/api");var A=async i=>{let t=await(0,s.showToast)({style:s.Toast.Style.Animated,title:"Opening URL in Simulator"});try{await l.openUrl(i.arguments.url),await(0,s.closeMainWindow)()}catch(o){if(o instanceof a)switch(o.reason){case"Bad Url":t.style=s.Toast.Style.Failure,t.title="Please enter a valid url";break;case"No simulator booted":t.style=s.Toast.Style.Failure,t.title="No simulator is booted, please boot a simulator to open a url.",t.primaryAction={title:"Manage Simulators",onAction:async e=>{await(0,s.launchCommand)({name:"manage-simulators.command",type:s.LaunchType.UserInitiated}),await e.hide()}};break;case"Xcode is not installed":await t.hide(),await(0,s.launchCommand)({name:"manage-simulators.command",type:s.LaunchType.UserInitiated});break}else t.style=s.Toast.Style.Failure,t.title="An error occurred while trying to open the url",t.message=`${o}`}};
