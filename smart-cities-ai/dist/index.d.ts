export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_system(params: { system_type: string; framework: string }): Promise<McpResult>;
  export function audit_surveillance(params: { system_id: string; checks: string }): Promise<McpResult>;
  export function evaluate_equity(params: { system_id: string; metric: string }): Promise<McpResult>;
  export function generate_report(params: { city_id: string; scope: string }): Promise<McpResult>;
};
