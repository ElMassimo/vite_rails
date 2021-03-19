import { readFileSync } from 'fs'

import { ENV_PREFIX } from './constants'

import type { HttpsOption } from './types'

// Internal: Returns true if the specified value is a plain JS object
export function isObject (value: unknown): value is Record<string, any> {
  return Object.prototype.toString.call(value) === '[object Object]'
}

// Internal: Simplistic version that gets the job done for this scenario.
// Example: screamCase('buildOutputDir') === 'BUILD_OUTPUT_DIR'
export function screamCase (key: string) {
  return key.replace(/([a-z])([A-Z])/g, '$1_$2').toUpperCase()
}

// Internal: Returns a configuration option that was provided using env vars.
export function configOptionFromEnv (optionName: string) {
  return process.env[`${ENV_PREFIX}_${screamCase(optionName)}`]
}

// Internal: Ensures it's easy to turn off a setting with env vars.
export function booleanOption (value: 'true' | 'false' | boolean | any): boolean | any {
  if (value === 'true') return true
  if (value === 'false') return false
  return value
}

// Internal: Returns the filename without the extension.
export function withoutExtension (filename: string) {
  return filename.substr(0, filename.lastIndexOf('.'))
}

// Internal: Loads a json configuration file.
export function loadJsonConfig<T> (filepath: string): T {
  return JSON.parse(readFileSync(filepath, { encoding: 'utf8', flag: 'r' })) as T
}

// Internal: Removes any keys with undefined or null values from the object.
export function cleanConfig (object: Record<string, any>) {
  Object.keys(object).forEach((key) => {
    const value = object[key]
    if (value === undefined || value === null) delete object[key]
    else if (isObject(value)) cleanConfig(value)
  })
  return object
}
