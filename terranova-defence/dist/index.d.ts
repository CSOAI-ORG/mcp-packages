export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_autonomous_system(params: { system_id: string; framework: string }): Promise<McpResult>;
  export function evaluate_coalition(params: { system_id: string; partners: string }): Promise<McpResult>;
  export function audit_c2_systems(params: { system_id: string; domain: string }): Promise<McpResult>;
  export function classify_autonomy(params: { system_id: string; classification: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
