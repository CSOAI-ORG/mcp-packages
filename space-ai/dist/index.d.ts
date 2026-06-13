export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_mission_ai(params: { mission_id: string; system_type: string }): Promise<McpResult>;
  export function evaluate_autonomy(params: { system_id: string; scenario: string }): Promise<McpResult>;
  export function audit_satellite_ops(params: { satellite_id: string; domain: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
