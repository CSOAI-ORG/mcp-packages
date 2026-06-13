export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function generate_keys(params: { algorithm: string; security_level: string }): Promise<McpResult>;
  export function encrypt_data(params: { data: string; algorithm: string }): Promise<McpResult>;
  export function assess_quantum_risk(params: { system_id: string; timeline: string }): Promise<McpResult>;
  export function migrate_crypto(params: { current_algorithms: string; priority: string }): Promise<McpResult>;
};
